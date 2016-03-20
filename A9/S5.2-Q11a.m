Import[StringJoin[{NotebookDirectory[], "../EulersMethod.m"}]];
f[t_, w_] := -w + t + 1;
fExact[t_] := E^(-t) + t;
EulersMethod[f, 0, 5, 25, 1, fExact];
EulersMethod[f, 0, 5, 50, 1, fExact];
EulersMethod[f, 0, 5, 100, 1, fExact];
