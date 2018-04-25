clearvars
clc

% Universal gas constant
gas_constant = 8314; % J/K.Kmol

% Nitrogen molecular mass.
mm_N = 28;

% Maximum BOL temperature of the high pressure tank is 303 K.
% Assume a maximum BOL pressure of 27.6 MPa.
% The density of the pressurant gas using the lookup table:
p = 273.4; % kg/m^3

% Tank pressure at EOL.
% Assumed to being the lowest acceptable thruster inlet pressure.
P_eol = 2e6; % Pa

% Mass, density, and volume of N2H4 propellant at BOL:
N2H4_mass_bol = 20; % kg
N2H4_density_bol = 1020; % kg/m^3
N2H4_vol = N2H4_mass_bol / N2H4_density_bol; % m^3

% Specific gas contant of the pressurant gas.
R_gas = gas_constant / mm_N;

% Gas temperature at EOL.
% Assumed to be the lowest operating temperature of the tanks.
T_eol = 283; % K

% The pressurant gass mass.
M_gas = (P_eol*N2H4_vol) / (R_gas*T_eol - P_eol/p) % Kg

% Determing the pressure tank volume from mass and gas density.
V_press = M_gas/p % Unit? m^3?

% Tank pressure at BOL.
% Assumed to being the lowest acceptable thruster inlet pressure.
P_bol = 6e6; % Pa

% Gas temperature at BOL.
% Assumed to be the lowest operating temperature of the tanks.
T_bol = 303; % K

% The pressurant gass mass.
M_gas = (P_eol*N2H4_vol) / (R_gas*T_bol - P_bol/p) % Kg

% Determing the pressure tank volume from mass and gas density.
V_press = M_gas/p % Unit? m^3?