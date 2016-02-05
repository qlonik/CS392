Import[FileNameJoin[{
  NotebookDirectory[], "..", "GaussianBackwardsSubst.m"}]];

M = {
  { 1, 1 / 2, 1 / 3, 1 / 4, 1 / 6 },
  { 1 / 2, 1 / 3, 1 / 4, 1 / 5, 1 / 7 },
  { 1 / 3, 1 / 4, 1 / 5, 1 / 6, 1 / 8 },
  { 1 / 4, 1 / 5, 1 / 6, 1 / 7, 1 / 9 }
};
GaussianBackwardsSubst[N[M, 10]]
