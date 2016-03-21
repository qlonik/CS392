Import[StringJoin[{NotebookDirectory[], "../TaylorsMethod.m"}]];
f[t_, y_] := -t * y + 4 * t / y;
TaylorsMethod[4, f, 0, 1, 10, 1]
