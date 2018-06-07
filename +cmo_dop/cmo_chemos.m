function [T,Y] = cmo_chemos(param, ini, dopuse, nulim, mort, APA, remtype)
%param.tch_ss;
t=0:0.1:50;
options=odeset('Reltol',1e-12,'Abstol',1e-9,'nonnegative',1:7,'Maxstep',0.01);
y0 = [ini.DIN0 ini.DIP0 ini.PhyC0 ini.PhyN0 ini.PhyP0 ini.Chl0 ini.DOP0];
[T, Y] = ode45(@(t, y) cmo_dop.cmo_chemos_ode(t,y',param,dopuse,nulim,mort,APA,remtype)', t, y0, options);

       

