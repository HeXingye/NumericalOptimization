function grad = grad_fun(x)
% defines the gradient of the cost function 
% x: Rn
% grad: Rn -> Rn

global c % Q is PD

%grad = Q*x;
grad=[4*c*(c*x(1,:)-2).^3+2*c*x(2,:).^2.*(c*x(1,:)-2) ; 2*x(2,:).*(c*x(1,:)-2).^2+2*(x(2,:)+1)]

end






