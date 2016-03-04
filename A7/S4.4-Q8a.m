f[x_] := x^2*Exp[-x^2];
approx[a_,b_,h_] := h/2 * (f[a] + f[b] + 2 * Sum[f[a+j*h], {j, 1, (b-a)/h-1}]);
SetPrecision[approx[0, 2, 0.25], 15]
