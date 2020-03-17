%FR-PR algorithm 5.44 in textbook
clc
clear all


c1 = 0.1;
c2 = 0.9;
a_max = 1e+6;
vv=0.1; % restar value

tol  = 1e-8;
maximum_iteration = 20000; 

n = 1000; 
x = zeros(n,maximum_iteration); 
error = zeros(1,maximum_iteration); 
error2 = zeros(1,maximum_iteration);

x_ast = ones(n,1); 

x(:,1) = 2*rand(n,1);
error(1) = norm(cost_fun(x(:,1)),inf);

f= cost_fun(x(:, 1));
grad = grad_fun(x(:, 1));
p = -grad;
k = 1;
while k < maximum_iteration && norm(grad,inf)>tol
    alpha = StepLength(p,x(:, k),c1,c2,a_max);
    x(:, k+1) = x(:, k) + alpha*p;
    grad_new=grad_fun(x(:, k+1));
    beta=(grad_new'*(grad_new-grad))/(grad'*grad);
    p = -grad_new + beta*p;
    grad=grad_new;  
    
    k = k+1;
    error(k) = norm(cost_fun(x(:,k)),inf);
end


figure;  
plot(1:1:k,log10(error(1:k)),'r-o'); 
grid on; hold on;
xlabel('k'); ylabel('log10(Error)');
title("problem1-FR PR")



