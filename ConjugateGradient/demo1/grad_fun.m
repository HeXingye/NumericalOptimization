function grad = grad_fun(x)
% defines the gradient of the cost function 
% x: Rn
% grad: Rn -> Rn

global Q % Q is PD
global b

grad = Q*x-b;


end






