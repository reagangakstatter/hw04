% Author: Reagan Gakstatter / reg0052@auburn.edu
% Date: 2024-10-29
% Assignment Name: hw04


classdef hw04
    methods (Static)
        function y = p1(data, eval)
            % Implement the divided difference method to interpolate the data points, then evaluate the polynomial at the given point.
            % :param data: a matrix of size n x 2, where the first column is the x values and the second column is the y values
            % :param eval: a column vector of x values at which to evaluate the polynomial
            % :return: a vector of y values corresponding to the evaluation points

            n = size(data, 1);
            y = zeros(size(eval));
            
            % Create the divided difference table
            D = zeros(n, n);
            D(:, 1) = data(:, 2);  % f[x0], f[x1], ...

            % Compute divided differences
            for j = 2:n  % Fill the divided difference table
                for k = 1:j-1
                    D(j, k + 1) = (D(j, k) - D(j - 1, k)) / (data(j, 1) - data(j - k, 1));
                end
            end
            
            % Evaluate the polynomial using Horner's method
            for i = 1:length(eval)
                x = eval(i);
                y(i) = D(1, 1);  % Start with the first term of the polynomial
                product = 1;

                for j = 2:n
                    product = product * (x - data(j - 1, 1));  % Update the product for Horner's method
                    y(i) = y(i) + D(j, j) * product;  % Add the terms
                end
            end
        end

        function y = p2(data, eval)
            % for 6630 ONLY
            % Implement the divided difference method to interpolate the data 
            % points, then evaluate the polynomial at the given point.
            %
            % :param data: a cell array of size n x 1, each cell is a vector 
            %              like (x, y0, y1, y2, y3, ..., ym). 
            %              y0 = f(x), 
            %              y1 = f'(x), 
            %              y2 = f''(x),
            %              ... ,
            %              ym = f^{(m)}(x).
            % 
            %              Note, different cells may have different lengths.
            %
            % :param eval: a vector of x values at which to evaluate the polynomial
            % :return: a vector of y values corresponding to the evaluation points

            n = length(data);
            y = zeros(size(eval));           
           
          
        end
    end
end
