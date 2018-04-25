clear all 
close all
clc

r_earth = physconst('EarthRadius') / 1e3; % Earth's radius (km).
u_earth =  398600; % Earth's standard gravitational parameter (km^3.s^-2).
h_geo = 35786; % GEO orbit altitude (km).
h_final = 600; % Final orbit altitude to reach via hohmann transfer (km).

r_geo = r_earth + h_geo;
r_final = r_earth + h_final;

%---------------------------%
% First maneuver velocities %
%---------------------------%
% Initial vehicle velocity is velocity at GEO.
v_geo = sqrt(u_earth / r_geo);

% Velocity at perigee.
v_p = v_geo * sqrt((2 * r_final) / (r_geo + r_final));

% Delta-V
DeltaV_1 = v_p - v_geo % km/s.

%----------------------------%
% Second maneuver velocities %
%----------------------------%
% Initial vehicle velocity is velocity at apogee.
v_a = sqrt(u_earth / r_final) *  sqrt((2 * r_geo) / (r_geo + r_final)); 

% Needed final velocity.
v_f = sqrt(u_earth / r_final);

% Delta-V
DeltaV_2 = v_f - v_a % km/s.

%---------------%
% Total Delta-V %
%---------------%
DeltaV_Tot = DeltaV_1 + DeltaV_2

%---------------%
% Transfer Time %
%---------------%
% The transfer time is half of the transfer orbital period

% Semi-major axis of the transfer orbit.
a_transfer = (r_geo + r_final) / 2;

% Transfer orbit period.
T = 2 * pi * sqrt(a_transfer^3 / u_earth) % seconds.
T_days = T / 3600 % days.

% Transfer time.
t_transfer = T / 2 % seconds.
t_transfer_days = t_transfer / 3600 % days.

