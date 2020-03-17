function pk=dogleg(xk,delta_k)
%Trust Region Method based on Dogleg
gk = grad_fun(xk);
Bk = hess_fun(xk);
pu = -(gk'*gk)/(gk'*Bk*gk)*gk;
pb = -inv(Bk)*gk;
if sqrt(pb'*pb)<=delta_k
    pk = pb;
else
    if norm(pu)>=delta_k
        pk = -delta_k/sqrt(gk'*gk)*gk;
    else
        a=norm(pb-pu)^2;
        b=2*(pb-pu)'*pu;
        c=norm(pu)^2-delta_k^2;
        t=1+(-b+sqrt(b^2-4*a*c))/(2*a);
        pk=pu+(t-1)*(pb-pu);
    end
end

