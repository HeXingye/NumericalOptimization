function grad = grad_fun(x)
% defines the gradient of the cost function 
% x: Rn
% grad: Rn -> Rn

global c % Q is PD

%grad = Q*x;
%grad=[400*x(1,:).^3-400*x(1,:).*x(2,:)+2*x(1,:)-2 ; 2*x(2,:)-2*x(1,:).^2]
grad=[400*x(1,:).^3-400*x(1,:).*x(2,:)+2*x(1,:)-2 ; 200*x(2,:)-200*x(1,:).^2]
end






