GaussianScaledPartialPivoting::usage =
    "GaussianScaledPartialPivoting[A] solves system of linear equations " <>
        "with indexes specified in matrix A. This method assumes that the " <>
        "number of unknowns is number of columns minus 1.";

GaussianScaledPartialPivoting[AImmutable_] := Module[{A, n, x, s, NROW, i},
  A = AImmutable;
  n = Length[A[[1]]] - 1;
  x = Table[0, n];
  s = Table[0, n];
  NROW = Range[n];

  For[i = 1, i <= n, i++, Module[{},
    s[[i]] = Max[Table[A[[i, j]], {j, i, n}]];
    If[s[[i]] == 0, Throw["no unique solution exists"]];
  ]];

  For[i = 1, i < n, i++, Module[{p, m, maxNROW, j},
    p = i;
    m = Table[0, {i, 1, n}, {j, 1, n + 1}];
    maxNROW = Max[Table[
      Abs[ A[[ NROW[[ j ]], i ]] ] / s[[ NROW[[ j ]] ]],
      {j, i, n}
    ]];

    While[p <= n && Abs[A[[NROW[[p]], i]] / s[[NROW[[p]]]]] != maxNROW, p++];
    If[p > n, Throw["no unique solution exists"]];
    If[A[[NROW[[p]], i]] == 0, Throw["no unique solution exists"]];
    If[NROW[[i]] != NROW[[p]], NROW[[{i, p}]] = NROW[[{p, i}]]];
    For[j = i + 1, j <= n, j++, Module[{},
      m[[NROW[[j]], i]] = A[[NROW[[j]], i]] / A[[NROW[[i]], i]];
      A[[NROW[[j]]]] -= m[[NROW[[j]], i]] * A[[NROW[[i]]]];
    ]];
  ]];

  If[A[[NROW[[n]], n]] == 0, Throw["no unique solution exists"]];

  x[[n]] = A[[NROW[[n]], n + 1]] / A[[NROW[[n]], n]];
  For[i = n - 1, i >= 1, i--, Module[{sum},
    sum = Sum[A[[NROW[[i]], j]] * x[[j]], {j, i + 1, n}];
    x[[i]] = (A[[NROW[[i]], n + 1]] - sum) / A[[NROW[[i]], i]]
  ]];

  Return[x];
];
