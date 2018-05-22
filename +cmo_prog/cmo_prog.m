function [T, Y] = cmo_prog(param,ini,dopuse,nulim,mort,APA,remtype)
t=[0 20];
options=odeset('Reltol',1e-12,'Abstol',1e-9,'nonnegative',1:7,'Maxstep',0.01);
y0 = [ini.DIN0 ini.DIP0 ini.PhyC0 ini.PhyN0 ini.PhyP0 ini.Chl0 ini.DOP0];
tic
[T, Y] = ode45(@(t,y) cmo_prog.cmo_ode(t,y',param,dopuse,nulim,mort,APA,remtype)',t,y0,options);
toc