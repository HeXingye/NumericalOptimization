function cost = cost_fun(x)
global Q
cost = log(1+x'*Q*x);
end