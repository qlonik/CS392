LagrangeInterpolatingPolynomial::usage = "";

LagrangeInterpolatingPolynomial[xVal_, fxVal_] := Module[{n},
  n = Length[xVal] - 1;

  Return[Function[{x},
    Sum[
      fxVal[[k + 1]] * Product[
        If[i != k, (x - xVal[[i + 1]]) / (xVal[[k + 1]] - xVal[[i + 1]]), 1],
        {i, 0, n}]
      , {k, 0, n}]
  ]];
];
