
function y = cpedigitalfilter(x, b, a)
    N = length(b);  % order of c
    M = length(a);      % order of d
    % Initialize y vector with zeros
    y = zeros(size(x));
    
    % Calculate y[n]
    for n = 1:length(x)
        sum_b = 0;
        sum_a = 0;
        
        % Calculate sum of b_i * x[n-i]
        for i = 1:N
            if n - i > 0
                % n-i+1
                sum_b = sum_b + b(i) * x(n-i+1);
            end
        end
        
        % Calculate sum of a_j * y[n-j]
        for j = 1:M
             if n - j > 0
                sum_a = sum_a + a(j) * y(n-j+1);
             end
        end
        
        % Calculate y[n]
        y(n) = sum_b - sum_a;
    end
end