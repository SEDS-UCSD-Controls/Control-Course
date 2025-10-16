%% Cart Models
q = (M+m)*(I+m*l^2)-(m*l)^2; % Denominator
s = tf('s');

P_cart = (((I+m*l^2)/q)*s^2 - (m*g*l/q))/(s^4 + (b*(I + m*l^2))*s^3/q - ((M + m)*m*g*l)*s^2/q - b*m*g*l*s/q);

P_pend = (m*l*s/q)/(s^3 + (b*(I + m*l^2))*s^2/q - ((M + m)*m*g*l)*s/q - b*m*g*l/q);

%% PID Analysis
G1 = P_pend
G2 = minreal(P_cart/P_pend)

G1_bandwidth = 40;
G3_bandwidth = 23;

[angle_controller, info] = pidtune(G1, 'PID', G1_bandwidth);
inner_loop = feedback(angle_controller*G1,1);

margin(inner_loop)

G3 = inner_loop*G2;

[position_controller, info] = pidtune(G3, 'PID', G3_bandwidth)
outer_loop = feedback(position_controller*G3, 1);

margin(outer_loop)