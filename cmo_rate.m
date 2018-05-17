function rate = cmo_rate(y, param, dopuse, nulim, mort, APArate)
%
DIN  = y(:,1); % unit: umolN/L
DIP  = y(:,2); % unit: umolP/L
PhyC = y(:,3); 
PhyN = y(:,4)+param.Q0N.*PhyC;
PhyP = y(:,5)+param.Q0P.*PhyC;
Chl  = y(:,6);
DOP  = y(:,7);
%
rate.QN = PhyN./PhyC; %cellular N:C ratio, mol/mol
rate.QP = PhyP./PhyC; %cellular P:C ratio, mol/mol
rate.theta= Chl./PhyC; % cellular Chl:C ratio, gchl/mol
rate.fV = param.QsN./rate.QN-param.zN.*(rate.QN-2.*param.QsN);% Fraction of QN allocated for nutrient acquisition, dimensionless
rate.fC = max(1 - rate.fV - param.QsN./rate.QN,0);% Fraction of QN allocated for C fixation
rate.mu0= param.V0C./(param.rdl+param.daylen); % Potential rate of carbon-fixation, d-1 
rate.I0 = param.RC.*param.zC./(param.alpha.*param.daylen); % Threshold irradience, mol/m2/d
rate.aim= param.alpha.*param.PARda./rate.mu0; % shorthand, mol/gchl
if ((~isnan(rate.theta))& (~isinf(rate.theta)))% dynamic Chl:C ratio
rate.tch= rate.theta./rate.fC; %chloroplast Chl:C, gchl/mol
rate.SI = 1-exp(-rate.tch.*rate.aim);%light saturation, dimensionless
rate.rctht = rate.fC.*(param.daylen.*(param.alpha.*param.PARda.*(1 - rate.SI)...
             .*(1./param.zC - rate.tch) - rate.SI.*rate.mu0)- param.RC); %rate of change of Chl:C ratio, d-1
rate.dtdq = (2.*param.QsN./rate.QN.^2 + param.zN);%tch/theta*dtheta/dQN, mol/mol

elseif  (param.PARda>=rate.I0)  % steady-state Chl:C ratio         (A4)
rate.tch = 1.0/param.zC + (1.0 - lambertw((1.0 + param.RC/(param.daylen.*rate.mu0))...
           .*exp(1.0 + rate.aim/param.zC)))/rate.aim; % chloroplast Chl:C ratio, gchl/mol
else                       
    rate.tch = 0.0; % below light threshold: no Chl, no growth
end
rate.SI = 1.0 - exp(-rate.tch.*param.alpha.*param.PAR./rate.mu0);%Light saturation, dimensionless 
rate.A  = param.dlfA.*rate.mu0.*rate.SI.*(1-param.zC.*rate.tch)-...
          param.RC.*param.zC.*rate.tch; %light-depenence of growth, d-1

rate.VNmax = param.V0N.*max((1-param.Q0P./rate.QP),0);%Maximum N aquisition rate, mol/mol/d 
rate.an = param.A0.*DIN; % d-1
if strcmp(dopuse,'DIP') 
rate.fDOP = 1-DIP./(DIP+param.kdip); % Factor for DOP availability, dimensionless     
elseif strcmp(dopuse,'QP')
rate.fDOP = (param.Q0P./rate.QP).^2./((param.Q0P./rate.QP).^2+param.kqp);  % Factor for DOP availability, dimensionless   
else
rate.fDOP=0;      
end
if strcmp(APArate,'linear')
   rate.util_DOP=param.APA.*rate.fDOP.*DOP;
elseif strcmp(APArate,'nonlinear')
   rate.util_DOP=rate.fDOP.*DOP;
else 
   rate.util_DOP=rate.fDOP.*DOP;
end
rate.ap   = param.A0.*(DIP+rate.util_DOP); % d-1
rate.VNh0 = (sqrt(1./rate.VNmax)+sqrt(1./rate.an)).^(-2);% Local potential N aquisition rate, mol/mol/d
rate.VPh0 = (sqrt(1./param.V0P)+sqrt(1./rate.ap)).^(-2);% Local potential P aquisition rate, mol/mol/d
rate.B =  sqrt(rate.VNh0./rate.VNmax)./(rate.QP./param.Q0P - 1.0);% shorthand,dimensionless    
rate.fN = 1.0./(1.0 + sqrt(rate.B.*rate.QP.*rate.VNh0./(rate.QN.*rate.VPh0)));% Allocation factor of QN*fV for N uptake, dimensionless
%rate.fN = 1./sqrt(param.Q0P./rate.QN.*param.V0N./rate.VPh0.*(rate.VNh0...
%          ./rate.VNmax).^(1.5));
rate.VN = rate.fV.*rate.fN.*rate.VNh0; % N aquisition rate, mol/mol/d
rate.VP = rate.fV.*(1-rate.fN).*rate.VPh0;% Total P aquisition rate, mol/mol/d
rate.VDOP = max(0,rate.VP.*(rate.util_DOP)./(DIP+rate.util_DOP));% DOP aquisition rate, mol/mol/d
rate.VDIP = rate.VP-rate.VDOP;% DIP aquisition rate, mol/mol/d
rate.VC0= rate.fC.*rate.A - param.zN.*rate.VN; % gross C aquisition rate, mol/mol/d
rate.XC = max(rate.VC0.*param.Q0P./rate.QP-rate.VP./param.Q0P,0)...
          .*max(2-rate.QP./param.Q0P,0); % DOC release rate to avoid outgrowing Q0P, mol/mol/d
rate.VC = rate.VC0- rate.XC;% C aquisition rate, mol/mol/d
rate.QNmax = param.Q0N.*(1+sqrt(1+1./param.zN./param.Q0N)); % Maximum QN, mol/mol
%%%%%%%%%%%%%%%%%%%%%%%%%   exudate     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(nulim,'NP') % both N and P limitation
rate.nulim = min(param.Q0P./rate.QP, (1./rate.QN-1./rate.QNmax)...
             ./(1./param.Q0N+1./rate.QNmax)); % N and P limitation factor, dimensionless 
elseif strcmp(nulim,'P')   % only consider P limitation   
rate.nulim = param.Q0P./rate.QP;  % P limitation factor, dimensionless 
elseif  strcmp(nulim,'N')   % only consider N limitation  
rate.nulim = (1./rate.QN-1./rate.QNmax)./(1./param.Q0N+1./rate.QNmax); % N limitation factor, dimensionless 
else % do not consider nutrient limitation, no DOP lysis   
rate.nulim = 1;
param.klys = 0;
end
rate.lys = param.klys.*(1+7.5.*(1-rate.nulim)); % DOC lysis rate, d-1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% DOP remineralization to DIP in dependent on APA %%%%%%%%%%
if strcmp(mort,'mort2dop')
rate.doprem=param.lamda_dop.*DOP;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rate.mortC   = param.mq.*PhyC.^2; %phytoplanlton C mortality, umol/L/d
rate.mortN   = rate.mortC.*rate.QN; %phytoplanlton N mortality, umol/L/d
rate.mortP   = rate.mortC.*rate.QP; %phytoplanlton P mortality, umol/L/d
rate.mortChl = rate.mortC.*rate.theta; %%phytoplanlton Chl mortality, ugChl/L/d
rate.Pchl    = (rate.VC+rate.rctht.*PhyC+rate.dtdq.*(rate.VN-rate.VC.*rate.QN)).*rate.theta;% Phytoplankton Chl change rate due to growth, ugChl/L/d 

