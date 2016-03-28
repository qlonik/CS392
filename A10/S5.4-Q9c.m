Import[StringJoin[{NotebookDirectory[], "../MidpointMethod.m"}]];
f[t_, y_] := 1 + y / t;
fExact[t_] := t * Log[t] + 2 * t;
MidpointMethod[f, 1, 2, 4, 2, fExact];
