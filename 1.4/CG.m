function x=CG(A, b, x0)
   x=x0 
   r0=A*x-b
   p=-r0; k=0; [n,n]=size(A);  
   while r0'*r0>1e-8 && k<n
       ap=A*p;
       alpha=r0'*r0/(p'*ap)
       x=x+alpha*p
       r=r0+alpha*ap
       beta=(r'*r)/(r0'*r0)
       p=-r+beta*p
       k=k+1;
       r0=r;
   end
end
       