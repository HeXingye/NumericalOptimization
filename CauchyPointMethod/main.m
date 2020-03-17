%Trust Region Method based on Cauchy Point method and Dogleg method
%And compare their performance
%Algorithm 4.1 in textbook
%Q is symmetric and P.D.
clc
clear all

global Q

tol  = 1e-8; 
maximum_iteration = 20000; 

delta_hat = 0.01;
eta = 1/10;

n = 100;
x = zeros(n,maximum_iteration);

Q = rand(n,n);
[Q,R] = qr(Q); 
lambda_min = 1;
lambda_max = 1000;
lambda = linspace(lambda_min,lambda_max,n); 
Q = Q'*diag(lambda)*Q; 

error = zeros(1,maximum_iteration); 
error2 = zeros(1,maximum_iteration); 
x_ast = zeros(n,1); % set global min

x(:,1) = 20*rand(n,1);
delta_k = 1/2*delta_hat;
error(1) = sqrt((x(:,1)-x_ast)'*Q*(x(:,1)-x_ast));
error2(1) = sqrt((x(:,1)-x_ast)'*Q*(x(:,1)-x_ast));

%begin of cauchy point method
k = 1;
pk = cauchy_point(x(:, 1), delta_k);
pk_norm = sqrt(pk'*pk);
rho_k = rho(x(:, 1), pk);

while k < maximum_iteration && norm(pk,inf)>tol    
    if rho_k<1/4
        delta_k = 1/4*delta_k;
    else
        if rho_k>3/4 && pk_norm==delta_k
            delta_k = min(2*delta_k,delta_hat);
        end
    end
    if rho_k > eta
        x(:, k+1) = x(:, k) + pk;
        error(k+1) = sqrt((x(:,k+1)-x_ast)'*Q*(x(:,k+1)-x_ast));
        k = k + 1;
    end
    pk = cauchy_point(x(:, k), delta_k);
    pk_norm = sqrt(pk'*pk);
    rho_k = rho(x(:, k), pk);    
end

%begin of dogleg method
k = 1;
pk = dogleg(x(:, 1), delta_k);
pk_norm = sqrt(pk'*pk);
rho_k = rho(x(:, 1), pk);

while k < maximum_iteration && norm(pk,inf)>tol 
    if rho_k < 1/4
        delta_k = 1/4 * delta_k;
    else
        if rho_k > 3/4 && pk_norm == delta_k
            delta_k = min(2*delta_k, delta_hat);
        end
    end
    if rho_k > eta
        x(:, k+1) = x(:, k) + pk;
        error2(k+1) = sqrt((x(:,k+1)-x_ast)'*Q*(x(:,k+1)-x_ast));
        k = k + 1;
    end
    pk = dogleg(x(:, k), delta_k);
    pk_norm = norm(pk);
    rho_k = rho(x(:, k), pk); 
end

figure; 
plot(1:1:k,log10(error(1:k)),'r-o');
grid on; hold on;
xlabel('k'); ylabel('log10(Error)')

plot(1:1:k,log10(error2(1:k)),'b-o');
grid on; hold on;
xlabel('k'); ylabel('log10(Error)')

title("Trust Region Method based on Cauchy Point method and Dogleg")
legend("error for Cauchy point method","error for Dogleg method")

