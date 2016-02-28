/**
 *
 * @param x
 * @param a
 * @returns {Function}
 */
function NaturalCubicSpline(x, a) {
  'use strict';
  const n = x.length - 1;
  const h = [];
  const alpha = [];
  const l = [];
  const mu = [];
  const z = [];
  const b = [];
  const c = [];
  const d = [];

  for (let i = 0; i <= n - 1; i++) h[i] = x[i + 1] - x[i];
  for (let i = 1; i <= n - 1; i++) {
    alpha[i] = 3 / h[i] * (a[i + 1] - a[i]) - 3 / h[i - 1] * (a[i] - a[i - 1]);
  }

  l[0] = 0;
  mu[0] = 0;
  z[0] = 0;

  for (let i = 1; i <= n - 1; i++) {
    l[i] = 2 * (x[i + 1] - x[i - 1]) - h[i - 1] * mu[i - 1];
    mu[i] = h[i] / l[i];
    z[i] = (alpha[i] - h[i - 1] * z[i - 1]) / l[i];
  }

  l[n] = 1;
  z[n] = 0;
  b[n] = 0;
  c[n] = 0;
  d[n] = 0;

  for (let j = n - 1; j >= 0; j--) {
    c[j] = z[j] - mu[j] * c[j + 1];
    b[j] = (a[j + 1] - a[j]) / h[j] - h[j] * (c[j + 1] + 2 * c[j]) / 3;
    d[j] = (c[j + 1] - c[j]) / (3 * h[j]);
  }

  return (y) => {
    let j;
    if (y <= x[0]) {
      j = 0;
    } else if (y >= x[n]) {
      j = n;
    } else {
      for (j = 0; j <= n && !(x[j] <= y && y <= x[j + 1]); j++) {}
    }

    return a[j] +
           b[j] * (y - x[j]) +
           c[j] * Math.pow((y - x[j]), 2) +
           d[j] * Math.pow((y - x[j]), 3);
  }
}

module.exports = NaturalCubicSpline;
