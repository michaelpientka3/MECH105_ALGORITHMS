function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
if length(x) ~= length(y)
    error("x and y must be the same size")
end

% FILTER
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);

n = length(x);
Q1 = sortedY(floor((n+1)/4)) 
Q3 = sortedY(floor((3*n+3)/4))
IQR = Q3-Q1

fX = [];
fY = [];

for i = 1:n
    if (sortedY(i) >= (Q1 - 1.5*IQR)) && (sortedY(i) <= (Q3 + 1.5*IQR))
        fX = [fX sortedX(i)];
        fY = [fY sortedY(i)];
    end
end

disp(fX)
disp(fY)


% LIN REG
n = length(fX);
sx = sum(fX);
sy = sum(fY);
sxy = sum(fX.*fY);
sx2 = sum(fX.^2);

% normal eqs
a1 = (n*sxy - sx*sy)/(n*sx2 - (sx)^2);
a0 = (sy/n) - a1*(sx/n);

slope = a1; intercept = a0;

% computer R^2
St = sum((fY - (sy/n)).^2);
Sr = sum((fY - a0 - a1*fX).^2);
Rsquared = (St-Sr)/St;

end