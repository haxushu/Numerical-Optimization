function gf=Gf(x,u)
%The gradient of the objective function.
    gf=[1+u*2*x(1)*(x(1)^2+x(2)^2-2); 1+u*2*x(2)*(x(1)^2+x(2)^2-2)];
end