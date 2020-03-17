function rho_k=rho(xk, pk)
%Evaluate ?k from formula (4.4)
fk1=cost_fun(xk);
fk2=cost_fun(xk+pk);
mk1=quard_model(xk,zeros(size(pk)));
mk2=quard_model(xk,pk);
rho_k=(fk1-fk2)/(mk1-mk2);
%measure the performance of model
end