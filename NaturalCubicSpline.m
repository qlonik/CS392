NaturalCubicSpline::usage = "";

NaturalCubicSpline[xVal_, a_] := Module[{n, i, h, alpha, l, mu, z, b, c, d},
  n = Length[xVal] - 1;
  h = Table[xVal[[i + 2]] - xVal[[i + 1]], {i, 0, n - 1}];
  alpha = Table[
    If[i == 0, 0,
      3 * (a[[i + 2]] - a[[i + 1]]) / h[[i + 1]] -
          3 * (a[[i + 1]] - a[[i]]) / h[[i]]
    ],
    {i, 0, n - 1}];

  l = Table[0, {i, 0, n}];
  mu = Table[0, {i, 0, n}];
  z = Table[0, {i, 0, n}];
  b = Table[0, {i, 0, n}];
  c = Table[0, {i, 0, n}];
  d = Table[0, {i, 0, n}];

  l[[1]] = 1;
  mu[[1]] = 0;
  z[[1]] = 0;

  For[i = 1, i <= n - 1, i++, Module[{},
    l[[i + 1]] = 2(xVal[[i + 2]] - xVal[[i]]) - h[[i]] * mu[[i]];
    mu[[i + 1]] = h[[i + 1]] / l[[i + 1]];
    z[[i + 1]] = (alpha[[i + 1]] - h[[i]] * z[[i]]) / l[[i + 1]];
  ]];

  l[[n + 1]] = 1;
  z[[n + 1]] = 0;
  b[[n + 1]] = 0;
  c[[n + 1]] = 0;
  d[[n + 1]] = 0;

  For[i = n - 1, i >= 0, i--, Module[{},
    c[[i + 1]] = z[[i + 1]] - mu[[i + 1]] * c[[i + 2]];
    b[[i + 1]] = (a[[i + 2]] - a[[i + 1]]) / h[[i + 1]] - h[[i + 1]] * (c[[i + 2]] + 2 * c[[i + 1]]) / 3;
    d[[i + 1]] = (c[[i + 2]] - c[[i + 1]]) / (3 * h[[i + 1]]);
  ]];

  Return[Function[{x},
    Module[{j},
      If[x <= xVal[[1]], j = 0,
        If[x >= xVal[[n + 1]], j = n,
          For[j = 0, j <= n && !(xVal[[j + 1]] <= x && x <= xVal[[j + 2]]), j++]
        ]
      ];

      a[[j + 1]] +
          b[[j + 1]] * (x - xVal[[j + 1]]) +
          c[[j + 1]] * (x - xVal[[j + 1]])^2 +
          d[[j + 1]] * (x - xVal[[j + 1]])^3
    ]
  ]];
];
