AdamsPredictorCorrector::usage = "";
AdamsPredictorCorrector[f_, a_, b_, Num_, alpha_] := Module[{h, t, w, k, i, j},
  h = (b - a) / Num;
  t[0] = a;
  w[0] = alpha;
  Print["t: ", N[t[0], 15], ", w: ", N[w[0], 15]];
  For[i = 1, i <= 3, i++,
    k[1] = h * f[t[i - 1], w[i - 1]];
    k[2] = h * f[t[i - 1] + h / 2, w[i - 1] + k[1] / 2];
    k[3] = h * f[t[i - 1] + h / 2, w[i - 1] + k[2] / 2];
    k[4] = h * f[t[i - 1] + h, w[i - 1] + k[3]];
    w[i] = w[i - 1] + (k[1] + 2 * k[2] + 2 * k[3] + k[4]) / 6;
    t[i] = a + i * h;
    Print["t: ", N[t[1], 15], ", w: ", N[w[1], 15]];
  ];
  For[i = 4, i <= Num, i++,
    t[-1] = a + i * h;
    w[-1] = w[3] + h / 24 * (
      55 * f[t[3], w[3]] - 59 * f[t[2], w[2]]
          + 37 * f[t[1], w[1]] - 9 * f[t[0], w[0]]
    );
    w[-1] = w[3] + h / 24 * (
      9 * f[t[-1], w[-1]] + 19 * f[t[3], w[3]]
          - 5 * f[t[2], w[2]] + f[t[1], w[1]]
    );
    Print["t: ", N[t[-1], 15], ", w: ", N[w[-1], 15]];
    For[j = 0, j <= 2, j++,
      t[j] = t[j + 1];
      w[j] = w[j + 1];
    ];
    t[3] = t[-1];
    w[3] = w[-1];
  ];
];
AdamsPredictorCorrector[f_, a_, b_, Num_, alpha_, fExact_] := Module[{h, t, w,
  k, i, j},
  h = (b - a) / Num;
  t[0] = a;
  w[0] = alpha;
  Print["t: ", N[t[0], 15], ", w: ", N[w[0], 15], ", y: ", N[fExact[t[0]], 15]];
  For[i = 1, i <= 3, i++,
    k[1] = h * f[t[i - 1], w[i - 1]];
    k[2] = h * f[t[i - 1] + h / 2, w[i - 1] + k[1] / 2];
    k[3] = h * f[t[i - 1] + h / 2, w[i - 1] + k[2] / 2];
    k[4] = h * f[t[i - 1] + h, w[i - 1] + k[3]];
    w[i] = w[i - 1] + (k[1] + 2 * k[2] + 2 * k[3] + k[4]) / 6;
    t[i] = a + i * h;
    Print["t: ", N[t[i], 15], ", w: ", N[w[i], 15], ", y: ",
      N[fExact[t[i]], 15]];
  ];
  For[i = 4, i <= Num, i++,
    t[-1] = a + i * h;
    w[-1] = w[3] + h / 24 * (
      55 * f[t[3], w[3]] - 59 * f[t[2], w[2]]
          + 37 * f[t[1], w[1]] - 9 * f[t[0], w[0]]
    );
    w[-1] = w[3] + h / 24 * (
      9 * f[t[-1], w[-1]] + 19 * f[t[3], w[3]]
          - 5 * f[t[2], w[2]] + f[t[1], w[1]]
    );
    Print["t: ", N[t[-1], 15], ", w: ", N[w[-1], 15], ", y: ",
      N[fExact[t[-1]], 15]];
    For[j = 0, j <= 2, j++,
      t[j] = t[j + 1];
      w[j] = w[j + 1];
    ];
    t[3] = t[-1];
    w[3] = w[-1];
  ];
];
