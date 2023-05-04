function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
% input
%   func - function to find roots of
%   xl, xu - lower and upper bounds that bracket root. will return error otherwise
%   es - stopping criterion, optional. defaults to 0.0001%
%   maxit - maximum iterations in root finding. defaults to 200
%   varargin - variable input arguments to func
% output 
%   root - root found by false-position algorithm
%   fx - func evaulated at root
%   ea - approximate error of root
%   iter - number of iterations to obtain root

if nargin < 4
    es = 0.000001;
end
if nargin < 5
    maxit = 200;
end

ea = 100;
iter = 0;
xr = xl;

while (ea >= es) || (iter < maxit)
    x_old = xr;
    xr = xu - (func(xu, varargin{:})*(xl-xu))/(func(xl, varargin{:}) - func(xu, varargin{:}));
  
    if func(xr, varargin{:})*func(xl, varargin{:}) < 0
        xu = xr;
    elseif func(xr, varargin{:})*func(xu, varargin{:}) < 0
        xl = xr;
    elseif func(xr, varargin{:}) == 0
        iter = iter + 1;
        ea = 0;
        break
    else
        error("xr and bound have same sign")
    end
    
    ea = abs((xr-x_old)/xr)
    
    % count new iteration
    iter = iter + 1;
end

root = xr;
fx = func(xr, varargin{:});

end
