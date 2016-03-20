TaylorsMethod::usage = "";
TaylorsMethod[n_, f_, a_, b_, Num_, alpha_] := Module[{h, t, w, i},
  h = (b - a) / Num;
  t = a;
  w = alpha;
  fWithYFn = f[x, y[x]];
  fCopy = f[x, y[x]];
  T[x_, y_] = 0;
  For[i = 1, i <= n, i++,
    T[x_, y_] = T[x, y] + h^(i - 1)/Factorial[i]*fCopy;
    fCopy = D[fCopy, x] /. {y'[x] -> fWithYFn};
  ];
  T[x_, y_] = T[x, y] /. {y[x] -> y};
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
  fWithYFn = f[x, y[x]];
  fCopy = f[x, y[x]];
  T[x_, y_] = 0;
  For[i = 1, i <= n, i++,
    T[x_, y_] = T[x, y] + h^(i - 1)/Factorial[i]*fCopy;
    fCopy = D[fCopy, x] /. {y'[x] -> fWithYFn};
  ];
  T[x_, y_] = T[x, y] /. {y[x] -> y};
  Print["t: ", N[t, 15], ", w: ", N[w, 15], ", y: ", N[fExact[t], 15]];
  For[i = 1, i <= Num, i++,
    w = w + h * T[t, w];
    t = a + i * h;
    Print["t: ", N[t, 15], ", w: ", N[w, 15], ", y: ", N[fExact[t], 15]];
  ];
];
