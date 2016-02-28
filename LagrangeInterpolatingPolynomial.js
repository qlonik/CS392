function LagrangeInterpolatingPolynomial(x, fx) {
  'use strict';
  const n = x.length - 1;

  /**
   *
   * @param y
   * @param k
   * @returns {number}
   */
  const L = (y, k) => {
    let result = 1;
    for (let i = 0; i <= n; i++) {
      if (i === k) continue;
      result *= (y - x[i]) / (x[k] - x[i]);
    }
    return result;
  };

  return y => {
    let P = 0;
    for (let k = 0; k <= n; k++) {
      P += fx[k] * L(y, k);
    }
    return P;
  }
}

module.exports = LagrangeInterpolatingPolynomial;
