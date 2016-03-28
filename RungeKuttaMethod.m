RungeKuttaMethod::usage = "";
RungeKuttaMethod[f_, a_, b_, Num_, alpha_] := Module[{h, t, w, i, k},
  h = (b - a) / Num;
  t = a;
  w = alpha;
  Print["t: ", N[t, 15], ", w: ", N[w, 15]];
  For[i = 1, i <= Num, i++,
    k[1] = h * f[t, w];
    k[2] = h * f[t + h / 2, w + k[1] / 2];
    k[3] = h * f[t + h / 2, w + k[2] / 2];
    k[4] = h * f[t + h, w + k[3]];
    w = w + (k[1] + 2 * k[2] + 2 * k[3] + k[4]) / 6;
    t = a + i * h;
    Print["t: ", N[t, 15], ", w: ", N[w, 15]];
  ];
];
RungeKuttaMethod[f_, a_, b_, Num_, alpha_, fExact_] := Module[{h, t, w, i, k},
  h = (b - a) / Num;
  t = a;
  w = alpha;
  Print["t: ", N[t, 15], ", w: ", N[w, 15], ", y: ", N[fExact[t], 15]];
  For[i = 1, i <= Num, i++,
    k[1] = h * f[t, w];
    k[2] = h * f[t + h / 2, w + k[1] / 2];
    k[3] = h * f[t + h / 2, w + k[2] / 2];
    k[4] = h * f[t + h, w + k[3]];
    w = w + (k[1] + 2 * k[2] + 2 * k[3] + k[4]) / 6;
    t = a + i * h;
    Print["t: ", N[t, 15], ", w: ", N[w, 15], ", y: ", N[fExact[t], 15]];
  ];
];
