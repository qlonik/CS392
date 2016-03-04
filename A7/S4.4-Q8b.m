f[x_] := x^2*Exp[-x^2];
approx[a_, b_, h_] :=
  h/3*(f[a] + f[b] + 2*Sum[f[a + 2*j*h], {j, 1, (b - a)/(2 h) - 1}] +
     4*Sum[f[a + (2*j - 1)*h], {j, 1, (b - a)/(2 h)}]);
SetPrecision[approx[0, 2, 0.25], 15]
