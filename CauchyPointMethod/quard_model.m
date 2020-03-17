function m = quard_model(xk,pk)
fk = cost_fun(xk);
gk = grad_fun(xk);
Bk = hess_fun(xk);
m = fk+gk'*pk+0.5*pk'*Bk*pk;
end