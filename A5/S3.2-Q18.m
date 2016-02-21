Import[FileNameJoin[{
  NotebookDirectory[], "..", "NewtonsDividedDifference.m"}]];

x = {1940, 1950, 1960, 1970, 1980, 1990};
f = {132165, 151326, 179323, 203302, 226542, 249633};

Print["1930: ", N[NewtonsDividedDifference[x, f][1930], 10]];
Print["1965: ", N[NewtonsDividedDifference[x, f][1965], 10]];
Print["2010: ", N[NewtonsDividedDifference[x, f][2010], 10]];
