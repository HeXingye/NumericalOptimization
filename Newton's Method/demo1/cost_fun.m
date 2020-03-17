function cost = cost_fun(x)
% defines cost function we want to minimize
% x: Rn
% cost: Rn -> R

global c

% A quadratic cost with weighting matrix Q
%cost = 0.5*x'*Q*x; 
%cost=100*(x(2,:)-x(1,:).^2).^2+(1-x(1,:)).^2
cost=100*(x(2,:)-x(1,:)^2).^2+(1-x(1,:)).^2
end






