%% Cart Models
q = (M+m)*(I+m*l^2)-(m*l)^2; % Denominator
s = tf('s');

P_cart = (((I+m*l^2)/q)*s^2 - (m*g*l/q))/(s^4 + (b*(I + m*l^2))*s^3/q - ((M + m)*m*g*l)*s^2/q - b*m*g*l*s/q);

P_pend = (m*l*s/q)/(s^3 + (b*(I + m*l^2))*s^2/q - ((M + m)*m*g*l)*s/q - b*m*g*l/q);


%% Successive Loop Closure Analysis
G1 = P_pend
G2 = minreal(P_cart/P_pend)

D1 = 214.02*(s+5.607)/(s+40);

inner_loop = feedback(D1*G1,1);
G3 = inner_loop*G2;

D2 = -4.84*(s+1)/(s+110);

full_loop = feedback(D2*G3,1);

figure
% Layout: 2 rows, 2 cols

% --- Pendulum bode on the left (span 2 rows)
subplot(2,2,[1 3])
margin(full_loop) % Use bode(P_pend) if you're not concerned with robustness
grid on;

% --- Pendulum Root Locus (top right)
subplot(2,2,2)
rlocus(full_loop)
grid on;

% --- Pendulum Nyquist Plot (bottom right)
subplot(2,2,4)
nyquist(full_loop)
grid on;

% --- Overall title
sgtitle('Full Cascaded Loop Transfer Function Analysis')