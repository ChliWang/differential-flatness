function [x, y, phi] = kinematic_vehicle_model(x0, y0, phi0, v, delta, L, dt)
    % 车辆运动学模型
    x_dot = v * cos(phi0);
    y_dot = v * sin(phi0);
    phi_dot = (v / L) * tan(delta);
   
    % 更新状态量
    x = x0 + x_dot * dt;
    y = y0 + y_dot * dt;
    phi = phi0 + phi_dot * dt;
end