f[x_]:=(2^x)*Sin[x];
Nfn[1,x_,h_]:=(f[x+h]-f[x-h])/(2h);
Nfn[j_,x_,h_]:=Nfn[j-1,x,h/2]+(Nfn[j-1,x,h/2]-Nfn[j-1,x,h])/(4^(j-1)-1);
N[Nfn[3,105/100,2/5],15]
