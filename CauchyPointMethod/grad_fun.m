function grad = grad_fun(x)
global Q
grad = 2.0*Q*x/(1+x'*Q*x);
end





