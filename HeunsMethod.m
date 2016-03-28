HeunsMethod::usage = "";
HeunsMethod[f_, a_, b_, Num_, alpha_] := Module[{h, t, w, i},
  h = (b - a) / Num;
  t = a;
  w = alpha;
  Print["t: ", N[t, 15], ", w: ", N[w, 15]];
  For[i = 1, i <= Num, i++,
    w = w + h / 4 * (f[t, w] + 3 * f[
      t + 2 * h / 3,
      w + 2 * h / 3 * f[
        t + h / 3,
        w + h / 3 * f[t, w]
      ]
    ]);
    t = a + i * h;
    Print["t: ", N[t, 15], ", w: ", N[w, 15]];
  ];
];
HeunsMethod[f_, a_, b_, Num_, alpha_, fExact_] := Module[{h, t, w, i},
  h = (b - a) / Num;
  t = a;
  w = alpha;
  Print["t: ", N[t, 15], ", w: ", N[w, 15], ", y: ", N[fExact[t], 15]];
  For[i = 1, i <= Num, i++,
    w = w + h / 4 * (f[t, w] + 3 * f[
      t + 2 * h / 3,
      w + 2 * h / 3 * f[
        t + h / 3,
        w + h / 3 * f[t, w]
      ]
    ]);
    t = a + i * h;
    Print["t: ", N[t, 15], ", w: ", N[w, 15], ", y: ", N[fExact[t], 15]];
  ];
];
