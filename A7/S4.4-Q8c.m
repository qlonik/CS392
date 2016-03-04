f[x_] := x^2*Exp[-x^2];
approx[a_, b_, h_] := 
  2 h*Sum[f[a + (2*j + 1)*h], {j, 0, ((b - a)/h - 2)/2}];
SetPrecision[approx[0, 2, 0.25], 15]
