function [flag, max_tor_v, max_tor_delta] = plot_compare(v, delta, v2, delta2, t, tor_)
    % 对比 kinedynamic model 与 diffFlat
    
    % 绘制速度对比图
    figure;
    plot(t, v, 'b-', 'LineWidth', 2);
    hold on;
    plot(t, v2, 'r--', 'LineWidth', 1.5);
    xlabel('time (s)');
    ylabel('v (m/s)');
    legend('kine.model', 'diffFlat.model', 'Location', 'best');
    grid on;
    title('Velocity Comparison');
    set(gcf, 'Color', 'white');
    
    % 绘制Delta对比图
    figure;
    plot(t, delta, 'b-', 'LineWidth', 2);
    hold on;
    plot(t, delta2, 'r--', 'LineWidth', 1.5);
    xlabel('time (s)');
    ylabel('delta (rad)');
    legend('kine.model', 'diffFlat.model', 'Location', 'best');
    grid on;
    title('Delta Comparison');
    set(gcf, 'Color', 'white');
    
    % 检查两组数据是否存在差异
    tol = tor_;
    max_tor_v = -1;
    max_tor_delta = [];
    if mean(abs(v - v2)) < tol 
       max_tor_v = max(abs(v - v2))
    end

    if mean(abs(v - v2)) < tol 
       max_tor_delta = max(abs(delta - delta2))
    end

    if mean(abs(v - v2)) < tol && mean(abs(delta - delta2)) < tol
        flag = true;
    else
        flag = false;
    end
end