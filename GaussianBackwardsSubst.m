GaussianBackwardsSubst::usage =
    "GaussianBackwardSubst[A] solves system of linear equations with " <>
        "indexes specified in matrix A. This method assumes that the " <>
        "number of unknowns is number of columns minus 1.";

GaussianBackwardsSubst[AImmutable_] := Module[{A, n, i, x},
  A = AImmutable;
  n = Length[A[[1]]] - 1;
  x = Table[0, n];

  For[i = 1, i < n, i++, Module[{p, j},
    p = i;

    While[p <= n && A[[p, i]] == 0, p++];
    If[p > n, Throw["no unique solution exists"]];

    If[p != i, A[[{p, i}]] = A[[{i, p}]]];

    For[j = i + 1, j <= n, j++, Module[{},
      A[[j]] -= A[[j, i]] / A[[i, i]] * A[[i]];
    ]];
  ]];

  If[A[[n, n]] == 0, Throw["no unique solution exists"]];

  x[[n]] = A[[n, n + 1]] / A[[n, n]];
  For[i = n - 1, i >= 1, i--, x[[i]] =
      (A[[i, n + 1]] - Sum[A[[i, j]] * x[[j]], {j, i + 1, n}]) / A[[i, i]]];

  Return[x];
];
