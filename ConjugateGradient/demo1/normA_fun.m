function normA = normA_fun(x)
% defines the matrix A norm |.|_A
global Q
global b

% A quadratic cost with weighting matrix Q
normA =sqrt(x'*Q*x); 

end






