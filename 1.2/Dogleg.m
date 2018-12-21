function p=Dogleg(B, g, delta)
    p=-B\g;
    if p'*p-delta^2>1e-8
        pu=-(g'*g)/(g'*B*g)*g;
        if pu'*pu-delta^2>1e-8
            p=pu/(pu'*pu)^2*delta;
        else
            a=(p-pu)'*(p-pu);
            b=2*(p-pu)'*pu-2*(p-pu)'*(p-pu);
            c=pu'*pu+(p-pu)'*(p-pu)-2*(p-pu)'*pu-delta^2;
            tau=(-b+sqrt(b^2-4*a*c))/(2*a);
            p=pu+(tau-1)*(p-pu);
        end
    end
end

        
        