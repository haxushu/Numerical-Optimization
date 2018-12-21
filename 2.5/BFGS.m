function x=BFGS(H0,x0,eps,Gf,u)
    k=0;gf0=Gf(x0,u);
    H=0.5*H0;    B0=H0;
    while gf0'*gf0>eps^2
        p=-H0*gf0;
        x=x0 + -p'*gf0/(p'*B0*p)*p;
        gf=Gf(x,u);
        s=x-x0; y=gf-gf0;   rho=1/(y'*s);
        H0=H0-H0*rho*y*s';
        H=H0; H0=y'*H0; H0=rho*s*H0;
        H=H - H0 + rho*s*s';
        B=B0-(B0*s)*(s'*B0)/(s'*B0*s)+y*y'/(y'*s);
        
        k=k+1;
        gf0=gf;
        x0=x;
        %x'
        H0=H;
        B0=B;
    end
end

        