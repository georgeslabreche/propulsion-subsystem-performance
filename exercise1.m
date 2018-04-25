clearvars
clc

g = 9.81; % Gravitational acceleration near Earth's surface (m/s).

cstar = 1220; % Characteristic velocity.
Cf = 1.5; % Thrust coefficient.
mdot_p = 73; % Mass flow rate in Kg/s.
At = 0.0248; % Throat area m^2.

% The effective exhaust velocity (m/s).
ue = cstar * Cf

% The specific impulse (seconds).
Isp = ue / g 

% Thrust (Newton).
T = mdot_p * cstar * Cf

% The pressure in the combustion chamber (Pascal).
Pc = T / (Cf * At)