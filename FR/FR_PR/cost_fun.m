function cost = cost_fun(x)

n=length(x);
cost=0;
for i=1:n-1
cost = cost+100*(x(i)^2-x(i+1))^2+(x(i)-1)^2;
end

end






