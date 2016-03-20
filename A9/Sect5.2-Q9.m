Import[StringJoin[{NotebookDirectory[], "../EulersMethod.m"}]];
f[t_, w_] := 2 * w / t + t^2 * E^t;
fExact[t_] := t^2 * (E^t - E);
EulersMethod[f, 1, 2, 10, 0, fExact];
