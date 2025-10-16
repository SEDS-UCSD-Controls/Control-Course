close all;

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