%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 车辆运动学模型 与 微分平坦方法
% Main State = [v, phi, delta, a_t, a_n]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all;

% 车辆参数
L = 2.5;  % 车辆轴距 (m)

% 模拟时间
t0 = 0;
tf = 10;
dt = 0.1;
t = t0:dt:tf;

% 输入控制量
% constant 
% v = 5 * ones(size(t));  % 车速 (m/s)
% delta = pi/8 * ones(size(t));  % 转向角 (rad)
% sin cos
v = 5 + 2 * sin(2 * pi * t / 5);  % 车速 (m/s)
delta = pi/8 * cos(2 * pi * t / 7);  % 转向角 (rad)



% 初始状态
x0 = 0;
y0 = 0;
phi0 = 0;
a_t0 = 0;
a_n0 = 0;

% 车辆状态量
x = zeros(size(t));
y = zeros(size(t));
phi = zeros(size(t));

x(1) = x0;
y(1) = y0;
phi(1) = phi0;
a_t = a_t0;
a_n = a_n0;

% 仿真
for i = 1:length(t)-1
    % 更新车辆状态
    [x(i+1), y(i+1), phi(i+1)] = kinematic_vehicle_model(x(i), y(i), phi(i), v(i), delta(i), L, dt);
end

path_x = x;
path_y = y;

[v2, phi2, delta2, a_t2, a_n2] = differential_flat_model(path_x, path_y, dt, L);

tor = 1e-1;
[flag, max_tor_v, max_tor_delta] = plot_compare(v, delta, v2, delta2, t, tor);
disp("flag: " + flag);
disp("max_tor_v: " + max_tor_v);
disp("max_tor_delta: " + max_tor_delta);
