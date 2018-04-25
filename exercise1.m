clearvars
clc

g = 9.81;  % gravitational acceleration near Earth's surface (m/s).

cstar = 1220; % characteristic velocity.
Cf = 1.5; % thrust coefficient.
mdot_p = 73; % mass flow rate in Kg/s.
At = 0.0248; % throat area m^2.

% The effective exhaust velocity (m/s).
ue = cstar * Cf

% The specific impulse (seconds).
Isp = ue / g 

% Thrust (Newton).
T = mdot_p * cstar * Cf

% The pressure in the combustion chamber.
Pc = T / (Cf * At)