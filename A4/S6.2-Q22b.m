Import[FileNameJoin[{
  NotebookDirectory[], "..", "GaussianBackwardsSubst.m"}]];

M = {
  { 3.3330, 15920, 10.333, 7953 },
  { 2.2220, 16.710, 9.6120, 0.965 },
  { -1.5611, 5.1792, -1.6855, 2.714 }
};
GaussianBackwardsSubst[N[M, 10]]
