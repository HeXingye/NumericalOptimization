%newton's method
clc
clear all
maximum_iteration = 2000;
tol = 1e-8;% tolerance
n=2; %dimension size
x = zeros(n, maximum_iteration);
x(:,1) =[1.2;1.2]; %initial point
error = zeros(1,maximum_iteration);
error(1) = cost_fun(x(:,1))
p = -grad_fun(x(:,1));

k=1
while k < maximum_iteration && norm(p,inf)>tol
%     a=inv(h);
%     pk=a*p;
    h = hessian_fun(x(:,k));
    a = inv(h);
    %pk=h\p;
    x(:,k+1) = x(:,k) +  a*p;
    p = -grad_fun(x(:,k+1));
   %h = hessian_fun(x(:,k+1));
    error(k+1) = cost_fun(x(:,k+1));  
    k=k+1;
end

figure; 

subplot(2,1,1); 
plot(1:1:k,error(1:k),'.'); set(gca,'fontsize', 14);
grid on; hold on;
xlabel('k','fontsize',14); ylabel('Error','fontsize',14)
title('newton method when initial value=[1.2;1.2]')

subplot(2,1,2); 
plot(1:1:k,log10(error(1:k)),'.'); set(gca,'fontsize', 14)
grid on; hold on;
xlabel('k','fontsize',14); ylabel('log10(Error)','fontsize',14)
