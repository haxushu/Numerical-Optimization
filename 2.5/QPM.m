function x=QPM(x0,u)
    tau=1;
    for k=0:10
        x=BFGS(2*[1 0;0 1],x0,tau,@Gf,u)
        %if (x-x0)'*(x-x0)<1e-10 break;
        u=u*2;
        tau=tau*0.1;
        x0=x;
    end
end
        