% Установка начальных условий
v0 = 50; % начальная скорость в м/с
theta = 30 * pi / 180; % начальный угол в радианах
x0 = 0; % начальное положение x
y0 = 0; % начальное положение y
vx0 = v0 * cos(theta); % начальная скорость по x
vy0 = v0 * sin(theta); % начальная скорость по y
g = 9.81; % ускорение свободного падения
% Временной диапазон
t0 = 0;
tf = 2 * vy0 / g; % время полета объекта до момента его падения
t = linspace(t0, tf, 100);
% Аналитическое решение
syms X(t) Y(t)
[VX0, VY0] = deal(vx0, vy0);
% Уравнения движения
eqns = [diff(X, t) == VX0, diff(Y, t) == VY0 - g*t];
conds = [X(0) == x0, Y(0) == y0];
sol = dsolve(eqns, conds);
%вывод аналитического решения в консоль
disp(sol);
% % Преобразование в численные функции
X_analytic = matlabFunction(sol.X);
Y_analytic = matlabFunction(sol.Y);
% Построение графика аналитического решения
t_vals = linspace(t0, tf, 100);
X_vals = X_analytic(t_vals);
Y_vals = Y_analytic(t_vals);
plot(X_vals, Y_vals, '--');
legend('Аналитическое решение');
title('Траектория объекта');
xlabel('x');
ylabel('y');