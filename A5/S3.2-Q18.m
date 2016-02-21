Import[FileNameJoin[{
  NotebookDirectory[], "..", "NewtonsDividedDifference.m"}]];

x = {1940, 1950, 1960, 1970, 1980, 1990};
f = {132165000, 151326000, 179323000, 203302000, 226542000, 249633000};

Print["1930: ", N[NewtonsDividedDifference[x, f][1930], 10]];
Print["1965: ", N[NewtonsDividedDifference[x, f][1965], 10]];
Print["2010: ", N[NewtonsDividedDifference[x, f][2010], 10]];
