function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
doTrapBool = 0;
diffs = diff(x);

if length(x) ~= length(y)
    error("x and y must be of same size")
end
if max(diffs) ~= min(diffs)
    error("x must be equally spaced")
end

% n = 2 case
if length(x) == 2
    warning("Warning: only 2 input points given, trapezoidal rule used")
    I = (x(2)-x(1))/2 * (y(1)+y(2));
% n = 3 case
elseif length(x) == 3
    I = (x(3)-x(1))/6 * (y(1) + 4*y(2) + y(3));
else
    if mod(length(diffs), 2) == 1
        warning("Warning: even number of segments, trapezoidal rule used on last segment")
        doTrapBool = 1;
    end
    % sum first last points
    I = y(1) + y(length(y)-doTrapBool);
    
    % sum even and odd interior points
    for i = 2:(length(x) - 1 - doTrapBool)
        if mod(i, 2) == 0
            I = I + 4*y(i);
            disp(4)
        else
            I = I + 2*y(i);
            disp(2)
        end
    end
    
    % multiply by (b-a)/3n
    I = (x(end) - x(1))/(3*length(diffs))*I;
    
    % add on last trapezoidal rule, if needed
    if doTrapBool == 1
        I = I + (diffs(1)/2)*(y(end) + y(end-1));
    end
end

end
