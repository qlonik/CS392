Import[FileNameJoin[{
  NotebookDirectory[], "..", "NewtonsDividedDifference.m"}]];

x1stDeg = {0.8, 1};
f1stDeg = {0.22363362, 0.65809197};
x2ndDeg = {0.7, 0.8, 1};
f2ndDeg = {0.01375227, 0.22363362, 0.65809197};
x3rdDeg = {0.6, 0.7, 0.8, 1};
f3rdDeg = {-0.17694460, 0.01375227, 0.22363362, 0.65809197};

Print["1st degree: ", NewtonsDividedDifference[x1stDeg, f1stDeg][0.9]];
Print["2nd degree: ", NewtonsDividedDifference[x2ndDeg, f2ndDeg][0.9]];
Print["3rd degree: ", NewtonsDividedDifference[x3rdDeg, f3rdDeg][0.9]];
