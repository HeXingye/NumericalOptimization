function pk=cauchy_point(x,delta_k)
%Trust Region Method based on Cauchy Point method
gk = grad_fun(x);
Bk = hess_fun(x);

if gk'*Bk*gk <= 0
    alpha = delta_k/sqrt(gk'*gk);
else
    alpha = min(delta_k/sqrt(gk'*gk),(gk'*gk)/(gk'*Bk*gk));
end
pk = -alpha*gk;
end

