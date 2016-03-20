TaylorsMethod::usage = "";
TaylorsMethod[n_, f_, a_, b_, Num_, alpha_] := Module[{h, t, w, i},
  h = (b - a) / Num;
  t = a;
  w = alpha;
  T[t_, y_] = Sum[
    h^(i - 1) * D[f[t, y[t]], {t, i - 1}] / Factorial[i],
    {i, 1, n}
  ] /. {y[t] -> y, y'[t] -> f[t, y]};
  Print["t: ", N[t, 15], ", w: ", N[w, 15]];
  For[i = 1, i <= Num, i++,
    w = w + h * T[t, w];
    t = a + i * h;
    Print["t: ", N[t, 15], ", w: ", N[w, 15]];
  ];
];
TaylorsMethod[n_, f_, a_, b_, Num_, alpha_, fExact_] := Module[{h, t, w, i},
  h = (b - a) / Num;
  t = a;
  w = alpha;
  T[t_, y_] = Sum[
    h^(i - 1) * D[f[t, y[t]], {t, i - 1}] / Factorial[i],
    {i, 1, n}
  ] /. {y[t] -> y, y'[t] -> f[t, y]};
  Print["t: ", N[t, 15], ", w: ", N[w, 15], ", y: ", N[fExact[t], 15]];
  For[i = 1, i <= Num, i++,
    w = w + h * T[t, w];
    t = a + i * h;
    Print["t: ", N[t, 15], ", w: ", N[w, 15], ", y: ", N[fExact[t], 15]];
  ];
];
