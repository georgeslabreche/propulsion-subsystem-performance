clearvars
clc

g = 9.81; % Gravitational acceleration near Earth's surface (m/s).
gas_constant = 8314; % J/K.Kmol 
T = 500000; % Thrust (Newton).
Isp = 300;  % Specific impulse (seconds).
M = 15; % Propellant molecular weight (kg/kmol).
gamma = 1.4; % Specific heat ratio.
Tc = 3300; % Combustion temperature (Kelvin).
Pa = 101325; % Ambient pressure at exhaust nozzel (Pascal).
Pe = Pa; % The nozzle is ideally expanded.

%-------------------------%
% Characteristic Velocity %
%-------------------------%
% Specific gas constant (J/K.Kg).
R = gas_constant / M; 

% Big Gamma.
Gamma = sqrt(gamma * (2 / (gamma+1))^((gamma+1)/(gamma-1)));

% Characteristic Velocity (m/s).
cstar = sqrt(R*Tc) / Gamma

%--------------------%
% Thrust Coefficient %
%--------------------%
% The effective exhaust velocity (m/s).
ue = Isp * g;

% Thrust coefficient.
Cf = ue / cstar

%-------------%
% Throat area %
%-------------%
% Pressure in the chamber (Pa).
syms x
eqnPc = ue == sqrt(2 * gamma/(gamma-1) * R * Tc * (1 - (Pe/x)^((gamma-1)/gamma)));
Pc = double(solve(eqnPc, x));

% Throat area (m^2).
At = T / (Pc * Cf)

%-----------%
% Exit area %
%-----------%
% Temperature at exit of Nozzle (K)
Te = Tc / (Pc / Pe)^((gamma-1)/2);

% Mach number.
Me = ue / sqrt(gamma * R * Te);

% Find Ae using Area Ratio formula (m^2).
Ae = (At/Me) * ((1 + (gamma-1)/2 * Me^2) / (1 + (gamma-1)/2))^((gamma+1)/(2*(gamma-1)))

%-----------------------%
% Bonus: Mass flow rate %
%-----------------------%
% The nozzle is ideally expanded (Pe=Pa).
% So T = mdot * ue + Ae(Pe-Pa) becomes T = mdot * ue.
% Calculate the mass flow rate (kg/s).
mdot = T / ue

% Question: Why is the following thrust coefficient:
%Gamma * sqrt(((2*gamma)/(gamma-1)) * (1 - (Pe/Pc)^((gamma-1)/gamma))) + Ae/At * (Pe/Pc - Pa/Pc)

% Not equal to this thrust coefficient:
%T / (Pc * At)







