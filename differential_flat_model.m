function [v, phi, delta, a_t, a_n] = differential_flat_model(path_x, path_y, dt, L)
    % 车辆微分平坦模型
    % 输入:
    %   path_x, path_y - 参考轨迹的x和y坐标
    %   dt - 时间步长
    %   L - 车辆的轴距
    % 输出:
    %   x, y, phi - 车辆位置和航向角
    %   x_dot, y_dot, phi_dot - 车辆速度和角速度
    %   a_t, a_n - 切向和法向加速度
    %   kappa - 曲率

    % 中点欧拉获取 x / y w.r.t t
    [x_dot, x_dot2] = centerDiff(path_x, dt);
    [y_dot, y_dot2] = centerDiff(path_y, dt);  
    % phi v a
    
    v = sqrt(x_dot.^2 + y_dot.^2);

    phi = atan2(y_dot, x_dot);
    
    delta = atan(L * (x_dot .* y_dot2 - y_dot .* x_dot2) ./ (x_dot.^2 + y_dot.^2).^(3/2));
  
    % at an
    a_t = (x_dot .* x_dot2 + y_dot .* y_dot2) ./ (sqrt(x_dot.^2 + y_dot.^2));
    a_n = (x_dot .* y_dot2 - y_dot .* x_dot2) ./ (sqrt(x_dot.^2 + y_dot.^2));
   
end