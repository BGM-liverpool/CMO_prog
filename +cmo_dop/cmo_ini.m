function ini=cmo_ini(param)
ini.DIN0  = 100;                         %unit: umolN/L
ini.DIP0  = 0.1;                       %unit: umolP/L
ini.PhyC0 = 4.0;                       %unit: umolC/L
ini.PhyN0 = 0.5-param.Q0N.*ini.PhyC0;  %unit: umolN/L
ini.PhyP0 = 0.03-param.Q0P.*ini.PhyC0; %unit: umolP/L
ini.Chl0  = 0.04;                      %unit: ugChl/L
ini.DOP0  = 0.0;                         %unit: umolP/L