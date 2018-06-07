function param=cmo_param
param.alpha = 0.9; % unit:m2/E mol/(gchl), Chl-specific light absorption coefficient
param.A0    = 0.15; % unit:m3/mmol/day, Potential nutrient affinity 
param.QsN   = 0.04; % unit:mol/mol, Partial N quota bound in structual protein 
param.Q0N   = 0.08; % unit:mol/mol, Subsistence N quota
param.Q0P   = 0.002; % unit:mol/mol, Subsistence P quota
param.V0C    = 5; % unit: mol/mol/day, Potential C aquisition rate
param.V0N    = 5; % unit: mol/mol/day, Potential N aquisition rate
param.V0P    = 5; % unit: mol/mol/day, Potential P aquisition rate
param.zC    = 1;  % unit: mol/gchl, Cost of photosynthesis coeffienciet
param.zN    = 0.6; % unit: mol/mol, Cost of DIN uptake
param.RC    = 0.1; % unit: d-1, Cost of chl maintaince
param.daylen= 1; % unit:  day length
param.rdl   = 0; % unit:  day-length parameter
param.dlfA  = 1; % unit:  day length factor for A  
param.PAR   = 6.05e2; %unit: molE/m2/d, irradiance = 700umolE/m2/d
param.PARda = 6.05e2; %unit: molE/m2/d, daily average irradiance
param.Rm = 0; %unit: d-1, respiration
%%
param.mq    = 0.01;% unit: m3/mmol/d, phytoplankton quadratic mortality 
%%
param.kdip  = 0.01; %unit:umol/L
param.kqp   = 0.4;  % dimentionless
param.km    = 0.05;  % umolP/L, half-saturation constant for enzyme kienetics

%% 
param.klys = 0; % unit: d-1, specific rate of lysis at opt.T with 
                      %           no nutrient limitation
%% 
param.lamda_dop=0.24; % unit: d-1, rate of DOP remineralization to DIP 
%%
param.Vapa0=0.01*24; % umolP/L/d, APA potential rate
%%
param.rd = 0.011.*24; %unit: d-1, chemostat dilution rate
%%
param.Nin= 100; % umolN/L, DIN concentration of chemostat inflow 
%%
param.Pin= 0.01; % umolP/L, DIP concentration of chemostat inflow
%
param.DOPin= 0.00; % umolP/L, DOP concentration of chemostat inflow