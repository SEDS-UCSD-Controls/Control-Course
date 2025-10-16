%{
NOTE: Run this file to load physical parameters for the nonlinear sim 
%}

%% Physical Parameters with Uncertainty
m = 442*(0.2*rand()+0.9); % kg (mass of the rocket)
g = 9.81; % m/s^2 (Gravity is assumed constant everywhere on earth)

max_thrust = 8000; % Newtons
min_thrust = 0; % Newtons
alpha = 0.2*rand()+0.9; % dimensionless (scales thrust output i.e. alpha*thrust)

max_angle = pi/18; % Radians
min_angle = -pi/18; % Radians
beta = 0.2*rand()+0.9; % dimensionless (scales gimbal angle output i.e. beta*angle)

angle_offset = 0; % radians (gimbal angle offset)
%angle_offset = (pi/90)*rand() - (pi/180); % uncomment if you want an extra challenge

actuator_lag = 0.2*rand()+0.9; % seconds (first order lag time)
engine_lag = 5*(0.2*rand()+0.9); % seconds (first order lag time)