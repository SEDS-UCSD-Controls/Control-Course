close all;

%% Cart Models
q = (M+m)*(I+m*l^2)-(m*l)^2; % Denominator
s = tf('s');

P_cart = (((I+m*l^2)/q)*s^2 - (m*g*l/q))/(s^4 + (b*(I + m*l^2))*s^3/q - ((M + m)*m*g*l)*s^2/q - b*m*g*l*s/q);

P_pend = (m*l*s/q)/(s^3 + (b*(I + m*l^2))*s^2/q - ((M + m)*m*g*l)*s/q - b*m*g*l/q);

%% Pendulum Transfer Function Analysis
figure
% Layout: 2 rows, 2 cols

% --- Pendulum bode on the left (span 2 rows)
subplot(2,2,[1 3])
margin(P_pend) % Use bode(P_pend) if you're not concerned with robustness
grid on;

% --- Pendulum Root Locus (top right)
subplot(2,2,2)
rlocus(P_pend)
grid on;

% --- Pendulum Nyquist Plot (bottom right)
subplot(2,2,4)
nyquist(P_pend)
grid on;

% --- Overall title
sgtitle('Pendulum Transfer Function Analysis')

%% Cart Transfer Function Analysis
figure
% Layout: 2 rows, 2 cols

% --- Pendulum bode on the left (span 2 rows)
subplot(2,2,[1 3])
margin(P_cart) % Use bode(P_pend) if you're not concerned with robustness
grid on;

% --- Pendulum Root Locus (top right)
subplot(2,2,2)
rlocus(P_cart)
grid on;

% --- Pendulum Nyquist Plot (bottom right)
subplot(2,2,4)
nyquist(P_cart)
grid on;

% --- Overall title
sgtitle('Cart Transfer Function Analysis')