function grad = grad_fun(x)

n=length(x);
grad=zeros(n,1);
grad(1)=400*x(1)^3-400*x(1)*x(2)+2*x(1)-2;
for i=2:n-1
    temp1=400*x(i)^3-400*x(i)*x(i+1)+2*x(i)-2;
    temp2=-200*x(i-1)^2+200*x(i);
    grad(i) = temp1+temp2;
end
grad(n)=-200*x(n-1)^2+200*x(n);
end






