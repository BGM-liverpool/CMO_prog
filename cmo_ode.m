function [dydt] = cmo_ode(~,y,param,dopuse,nulim,mort,APArate)
%
 rate = cmo_prog.cmo_rate(y,param,dopuse,nulim,mort,APArate);
 DIN  = y(:,1);
 DIP  = y(:,2);
 PhyC = y(:,3);
 PhyN = y(:,4);
 PhyP = y(:,5);
 Chl  = y(:,6);
 DOP  = y(:,7);
%
dydt = zeros(size(y));
dydt(:,1) = - rate.VN.*PhyC + rate.mortN;    %unit: umolN/L
dydt(:,3) =   rate.VC.*PhyC - rate.mortC-rate.lys.*PhyC;    %unit: umolC/L
dydt(:,4) =   rate.VN.*PhyC-rate.mortN - param.Q0N.*dydt(:,3);   %unit: umolN/L
dydt(:,5) =   rate.VP.*PhyC-rate.mortP - param.Q0P.*dydt(:,3)-rate.lys./2.*PhyP;   %unit: umolP/L
dydt(:,6) =   rate.Pchl - rate.mortChl; %unit: ugChl/L
if strcmp(mort,'mort2dip')
dydt(:,2) = - rate.VDIP.*PhyC + rate.mortP;    %unit: umolP/L
dydt(:,7) =  -rate.VDOP.*PhyC+rate.lys./2.*PhyP; %unit: umolP/L
elseif strcmp(mort,'mort2dop')
dydt(:,2) = - rate.VDIP.*PhyC + rate.doprem;    %unit: umolP/L
dydt(:,7) = - rate.VDOP.*PhyC+ rate.mortP + rate.lys./2.*PhyP- rate.doprem; %unit: umolP/L   
end