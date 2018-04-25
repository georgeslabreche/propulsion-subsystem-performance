% Orbital parameters.
r_earth = physconst('EarthRadius') / 1e3; % Earth's radius (km).
u_earth =  398600; % Earth's standard gravitational parameter (km^3.s^-2).
h_geo = 35786; % GEO orbit altitude (km).
h_final = 600; % Final orbit altitude to reach via hohmann transfer (km).
r_geo = r_earth + h_geo;
r_final = r_earth + h_final;

% Propulsion parameters
g = 9.81 / 1000;  % gravitational acceleration near Earth's surface (km/s).
m_i = 100; % Initial spacecraft mass (kg).
Isp = 300; % Specific impulse (seconds).
mdot_p = 0.135; % Mass flow rate of the thruster (kg/s).

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
DeltaV_Tot = DeltaV_1 + DeltaV_2 % km/s.

%---------------------------%
% Necessary Propellant Mass %
%---------------------------%
% For first maneuver:
% Propellant used for first maneuver (kg).
m_p_DeltaV_1 = m_i * (1 - exp(-abs(DeltaV_1 / (Isp * g))))

% Propellant left after first maneuver (kg).
m_p_left_1 = m_i - m_p_DeltaV_1

% For second maneuver:
% Propellant used for second maneuver (kg).
m_p_DeltaV_2 = (m_i - m_p_DeltaV_1) * (1 - exp(-abs(DeltaV_2 / (Isp * g))))

% Propellant left after second maneuver (kg).
m_p_left_2 = m_p_left_1 - m_p_DeltaV_2

% For both maneuvers:
% Propellant used for both maneuvers (kg).
m_p_DeltaV_Tot = m_p_DeltaV_1 + m_p_DeltaV_2

% Propellant left after both maneuvers (kg).
m_p_left_Tot = m_i - m_p_DeltaV_Tot

%---------------%
% Maneuver Time %
%---------------%
% For first maneuver:
t_m_DeltaV_1 = m_p_DeltaV_1 / mdot_p / 60 % minutes.

% For second maneuver:
t_m_DeltaV_2 = m_p_DeltaV_2 / mdot_p  / 60 % minutes.

% For both maneuvers:
t_m_Tot = t_m_DeltaV_1 + t_m_DeltaV_2 % minutes.

%---------------%
% Transfer Time %
%---------------%
% The transfer time is half of the transfer orbital period

% Semi-major axis of the transfer orbit.
a_transfer = (r_geo + r_final) / 2;

% Transfer orbit period.
T = 2 * pi * sqrt(a_transfer^3 / u_earth) % seconds.
T_hours = T / 3600 % hours.

% Transfer time.
t_transfer = T / 2 % seconds.
t_transfer_hours = t_transfer / 3600 % hours.

