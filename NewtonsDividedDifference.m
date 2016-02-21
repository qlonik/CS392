NewtonsDividedDifference::usage = "";

NewtonsDividedDifference[xImmutable_, fxImmutable_] := Module[{n, i, j, xs, F},
  n = Length[xImmutable] - 1;

  For[i = 0, i <= n, i++,
    xs[i] = xImmutable[[i + 1]];
    F[i, 0] = fxImmutable[[i + 1]];
  ];

  For[i = 1, i <= n, i++,
    For[j = 1, j <= i, j++,
      F[i, j] = (F[i, j - 1] - F[i - 1, j - 1]) / (xs[i] - xs[i - j])
    ];
  ];

  Return[Function[{x},
    F[0, 0] + Sum[
      F[i, i] * Product[
        x - xs[j], {j, 0, i - 1}
      ], {i, 1, n}
    ]
  ]];
];
