Import[FileNameJoin[{
  NotebookDirectory[], "..", "GaussianBackwardsSubst.m"}]];

M = {
  { 1 / 4, 1 / 5, 1 / 6, 9 },
  { 1 / 3, 1 / 4, 1 / 5, 8 },
  { 1 / 2, 1, 2, 8 }
};
GaussianBackwardsSubst[N[M, 10]]
