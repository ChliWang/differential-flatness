function  [x_dot, x_dot2] = centerDiff(x, dt)

    dx = diff(x);
    dx_forward =  [dx(1), dx]; % 使用中点欧拉法计算导数
    dx_backward = [dx  , dx(end)];
    dx_centeredDiff = (dx_forward + dx_backward) / 2;
    x_dot = dx_centeredDiff./dt;
    
    dx_dot = diff(x_dot);
    dx_dot_forward =  [dx_dot(1), dx_dot];
    dx_dot_backward = [dx_dot  , dx_dot(end)];
    dx_dot_centeredDiff = (dx_dot_forward + dx_dot_backward) / 2;
    x_dot2 = dx_dot_centeredDiff./dt; % x w.r.t t ; if grad_x w.r.t x: n*n 

end

