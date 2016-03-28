Import[StringJoin[{NotebookDirectory[], "../RungeKuttaMethod.m"}]];
f[t_, y_] := 1 + y / t;
fExact[t_] := t * Log[t] + 2 * t;
RungeKuttaMethod[f, 1, 2, 4, 2, fExact];
