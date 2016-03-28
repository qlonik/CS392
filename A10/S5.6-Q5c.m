Import[StringJoin[{NotebookDirectory[], "../AdamsPredictorCorrector.m"}]];
f[t_, y_] := 1 + y / t;
fExact[t_] := t * Log[t] + 2 * t;
AdamsPredictorCorrector[f, 1, 2, 5, 2, fExact];
