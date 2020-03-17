function cost = cost_fun(x)
% defines cost function we want to minimize
% x: Rn
% cost: Rn -> R

global Q
global b

% A quadratic cost with weighting matrix Q
cost = 0.5*x'*Q*x-b'*x; 

end






