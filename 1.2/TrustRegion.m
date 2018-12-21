function x=TrustRegion(Delta,delta,eta,x0)
    x=x0;
    g=[-400*x(1)*x(2) + 400*x(1)^3 + 2*x(1) - 2; -200*x(1)^2 + 200*x(2)];
    B=[1200*x(1)^2-400*x(2)+2  -400*x(1);
         -400*x(1)               200       ];
    while g'*g>1e-8
        x'
        B=[1200*x(1)^2-400*x(2)+2  -400*x(1);
           -400*x(1)               200       ];
        p=Dogleg(B,g,delta); 
        rho=((100*(x(2)-x(1)^2)^2+(1-x(1))^2) -...
            (100*(x(2)+p(2)-(x(1)+p(1))^2)^2+(1-x(1)-p(1))^2))/...
            (-g'*p-0.5*p'*B*p);
        if rho<0.25
            delta=0.25*delta;
        else
            if rho > 0.75 && abs(p'*p-delta^2)<1e-8
                delta=min(2*delta, Delta);
            end
        end
        
        if rho > eta
            x=x+p;
        end
        g=[-400*x(1)*x(2) + 400*x(1)^3 + 2*x(1) - 2; -200*x(1)^2 + 200*x(2)];
    end
end

        