TaylorsMethod::usage = "";
TaylorsMethod[n_, f_, a_, b_, Num_, alpha_] := Module[{h, t, w, i},
  h = (b - a) / Num;
  t = a;
  w = alpha;
  fWithYFn = f[t, y[t]];
  fCopy = f[t, y[t]];
  T[t_, y_] = 0;
  For[i = 1, i <= n, i++,
    T[t_, y_] = T[t, y] + h^(i - 1)/Factorial[i]*fCopy;
    fCopy = D[fCopy, t] /. {y'[t] -> fWithYFn};
  ];
  T[t_, y_] = T[t, y] /. {y[t] -> y};
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
  fWithYFn = f[t, y[t]];
  fCopy = f[t, y[t]];
  T[t_, y_] = 0;
  For[i = 1, i <= n, i++,
    T[t_, y_] = T[t, y] + h^(i - 1)/Factorial[i]*fCopy;
    fCopy = D[fCopy, t] /. {y'[t] -> fWithYFn};
  ];
  T[t_, y_] = T[t, y] /. {y[t] -> y};
  Print["t: ", N[t, 15], ", w: ", N[w, 15], ", y: ", N[fExact[t], 15]];
  For[i = 1, i <= Num, i++,
    w = w + h * T[t, w];
    t = a + i * h;
    Print["t: ", N[t, 15], ", w: ", N[w, 15], ", y: ", N[fExact[t], 15]];
  ];
];
