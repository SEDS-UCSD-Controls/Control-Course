%% Physical Parameters
M = 0.5;   % kg
m = 0.2;   % kg
b = 0.1;   % N/m/s
I = 0.006; % kg m^2
g = 9.8;   % m/s^2
l = 0.3;   % m

p = I*(M+m)+M*m*l^2; %denominator for the A and B matrices

%% Linear State-Space Model
A = [0      1              0           0;
     0 -(I+m*l^2)*b/p  (m^2*g*l^2)/p   0;
     0      0              0           1;
     0 -(m*l*b)/p       m*g*l*(M+m)/p  0];
B = [     0;
     (I+m*l^2)/p;
          0;
        m*l/p];
C = [1 0 0 0;
     0 0 1 0];
D = [0;
     0];