clearvars
clc

% Universal gas constant
%gas_constant = 8314; % J/K.Kmol 
gas_constant = 8.314; % J/K.mol (or m^3.Pa/K.mol)

% Nitrogen molecular mass.
mm_N = 28; % g/mol

% Mass, density, and volume of N2H4 propellant at BOL:
N2H4_mass_bol = 20; % kg
N2H4_density_bol = 1020; % kg/m^3
N2H4_vol = N2H4_mass_bol / N2H4_density_bol; % m^3

% Specific gas constant of the pressurant gas.
R_gas = (gas_constant / (mm_N / 1000)); % J/K.kg


% Tank pressure at EOL.
% Assumed to being the lowest acceptable thruster inlet pressure.
P_eol = 2e6; % Pa

% Gas temperature at EOL.
% Assumed to be the lowest operating temperature of the tanks.
T_eol = 283; % K

% The ideal gas law: pressure * volume = n * gas_constant * T.
% Where n = mass / molar mass.
% Density d = mass / volume.
% Combining the above, we get density like so:
d_eol = (P_eol * mm_N) / (gas_constant *  T_eol); % g/m^3
d_eol = d_eol / 1000 % kg/m^3


% Tank pressure at BOL.
% Assumed to being the lowest acceptable thruster inlet pressure.
P_bol = 6e6; % Pa

% Gas temperature at BOL.
% Assumed to be the lowest operating temperature of the tanks.
T_bol = 303; % K

% Density at BOL (i.e. maximum density)
d_bol = (P_bol * mm_N) / (gas_constant *  T_bol); % g/m^3
d_bol = d_bol / 1000 % kg/m^3


%------------------------%
% Mass and volume at EOL %
%------------------------%
% The pressurant gass mass. Use maximum density.
M_gas_eol = (P_eol*N2H4_vol) / ((R_gas*T_eol) - (P_eol/d_bol)) % Kg

% Determing the pressure tank volume from mass and gas density.
V_press_eol = M_gas_eol/d_eol % m^3

%--------------%
% Vlume at BOL %
%--------------%

% Determing the pressure tank volume from mass and gas density.
V_press_bol = N2H4_mass_bol/d_bol % m^3