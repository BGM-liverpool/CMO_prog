function [dydt] = cmo_chemos_ode(~, y, param, dopuse,nulim,mort,APA,remtype)
%
 rate = cmo_dop.cmo_rate(y,param,dopuse,nulim,mort,APA,remtype);
 DIN  = y(:,1);
 DIP  = y(:,2);
 PhyC = y(:,3);
 PhyN = y(:,4)+param.Q0N.*PhyC;
 PhyP = y(:,5)+param.Q0P.*PhyC;
 Chl  = y(:,6);
 DOP  = y(:,7);
%
dydt = zeros(size(y));
dydt(:,1) = - rate.VN.*PhyC + rate.mortN + param.rd.*(param.Nin - DIN);    %unit: umolN/L/d
dydt(:,3) =   rate.VC.*PhyC - rate.mortC - param.rd.*PhyC - rate.lys.*PhyC;    %unit: umolC/L/d
dydt(:,4) =   rate.VN.*PhyC - rate.mortN - param.rd.*PhyN - param.Q0N.*dydt(:,3);   %unit: umolN/L/d
dydt(:,5) =   rate.VP.*PhyC - rate.mortP - param.rd.*PhyP - param.Q0P.*dydt(:,3)-rate.lys.*PhyP;   %unit: umolP/L/d
dydt(:,6) =   rate.rchl.*Chl - rate.mortChl - param.rd.*Chl; %unit: ugChl/L/d
if strcmp(mort,'mort2dip')
  if strcmp(APA,'implicit')
     dydt(:,2) = - rate.VDIP.*PhyC + rate.mortP + param.rd.*(param.Pin - DIP); %unit: umolP/L/d
     dydt(:,7) = - rate.VDOP.*PhyC + rate.lys./2.*PhyP - param.rd.*DOP; %unit: umolP/L/d
  elseif strcmp(APA,'explicit')
     dydt(:,2) = - rate.VDIP.*PhyC + rate.mortP + rate.remdop + param.rd.*(param.Pin - DIP); %unit: umolP/L/d
     dydt(:,7) = - rate.remdop + rate.lys./2.*PhyP  + param.rd.*(param.DOPin - DOP); %unit: umolP/L/d
  end     
elseif strcmp(mort,'mort2dop')
   if strcmp(APA,'implicit')
   dydt(:,2) = - rate.VDIP.*PhyC + param.rd.*(param.Pin - DIP); %unit: umolP/L/d    
   dydt(:,7) = - rate.VDOP.*PhyC + rate.mortP + rate.lys./2.*PhyP + param.rd.*(param.DOPin - DOP); %unit: umolP/L/d
   elseif strcmp(APA,'explicit')
   dydt(:,2) = - rate.VDIP.*PhyC + rate.remdop + param.rd.*(param.Pin - DIP); %unit: umolP/L/d 
   dydt(:,7) = - rate.remdop + rate.mortP + rate.lys.*PhyP + param.rd.*(param.DOPin - DOP); %unit: umolP/L/ds   
   end
end 
