function x=DFP(B0,x0,eps,Gf)
    k=0;gf0=Gf(x0);B=B0;    
    H0=B0; % Only if B0=I can we get H0 accurately this way.
    while gf0'*gf0>eps^2
        p=-H0*gf0;
        x=x0 + -p'*gf0/(p'*B0*p)*p;
        gf=Gf(x);
        s=x-x0; y=gf-gf0;   rho=1/(y'*s);
        B0=B0-B0*rho*s*y';
        B=B0; B0=s'*B0; B0=rho*y*B0;
        B=B - B0 + rho*y*y';
        H=H0-(H0*y)*(y'*H0)/(y'*H0*y)+s*s'/(y'*s);
        
        k=k+1;
        gf0=gf;
        x0=x;
        x'
        B0=B;
        H0=H;
    end
    k
end

        