%CG algorithm 5.2 in textbook
clc
clear all

global Q
global b

c1 = 0.1;
c2 = 0.9; 
a_max = 1e+6;

tol  = 1e-8; 
maximum_iteration = 2000; 

n = 1000; 
x = zeros(n,maximum_iteration); 
error = zeros(1,maximum_iteration); 
error2 = zeros(1,maximum_iteration);


Q = rand(n,n);


[Q,R] = qr(Q); 
 lambda = zeros(n,1); %clustered distribution
 stepsize=(1000-10)/(n-1);
 a=499;
 lambda(1:a)=9+2*rand(a,1);
 lambda(a+1:n)=999+2*rand(n-a,1);
 lambda=sort(lambda);
Q = Q'*diag(lambda)*Q; 

b = rand(n,1);
x_ast = inv(Q) * b; %global min

% initial step
K=lambda(n)/lambda(1);
x(:,1) = 10*(2*rand(n,1)-1);
error(1) = sqrt((x(:,1)-x_ast)'*Q*(x(:,1)-x_ast));
error2(1)=2.0*((sqrt(K)-1)/(sqrt(K)+1))^0*normA_fun(x(:,1)-x_ast);


grad = grad_fun(x(:, 1));
p = -grad;
k = 1;
while k < maximum_iteration && norm(grad,inf)>tol
    alpha = (grad'*grad) / (p'*Q*p);
    x(:, k+1) = x(:, k) + alpha*p;
    grad_new = grad + alpha*Q*p;
    beta = (grad_new'*grad_new) / (grad'*grad);
    p = -grad_new + beta*p;
    grad=grad_new;
    error(k+1) = sqrt((x(:,k+1)-x_ast)'*Q*(x(:,k+1)-x_ast));
    error2(k+1)=2.0*((sqrt(K)-1)/(sqrt(K)+1))^(k+1)*normA_fun(x(:,1)-x_ast);
    k = k+1;
end


figure;  
plot(1:1:k,log10(error(1:k)),'b-o'); 
grid on; hold on;
xlabel('k'); ylabel('log10(Error)')

plot(1:1:k,log10(error2(1:k)),'r-o');
grid on; hold on;
xlabel('k'); ylabel('log10(Error)')

title("problem2-clustered distribution")
legend("error for CG algorithm","formula 5.36 in textbook")

