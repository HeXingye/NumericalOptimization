function hess = hess_fun(x)
global Q
hess=(2.0*Q*(1+x'*Q*x)-4.0*Q*x*x'*Q)/((1+x'*Q*x)^2);
end

