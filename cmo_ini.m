function ini=cmo_ini(param)
ini.DIN0  = 5;
ini.DIP0  = 0.1;
ini.PhyC0 = 4.0;
ini.PhyN0 = 0.5-param.Q0N.*ini.PhyC0;
ini.PhyP0 = 0.03-param.Q0P.*ini.PhyC0;
ini.Chl0  = 0.04;
ini.DOP0  = 0.1;