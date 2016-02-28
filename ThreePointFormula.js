const math = require('mathjs');

/**
 *
 * @param fx
 * @returns {Function}
 * @constructor
 */
function ThreePointFormula(fx) {
  'use strict';

  /**
   *
   * @param {Number} x
   * @param {Number} h
   * @returns {Number}
   */
  return (x, h) => {
    h = Math.abs(h);
    const xp2h = parseFloat(math.add(
      math.bignumber(x), math.multiply(2, math.bignumber(h))
    ).toString());
    const xph = parseFloat(math.add(
      math.bignumber(x), math.bignumber(h)
    ).toString());
    const xmh = parseFloat(math.subtract(
      math.bignumber(x), math.bignumber(h)
    ).toString());
    const xm2h = parseFloat(math.subtract(
      math.bignumber(x), math.multiply(2, math.bignumber(h))
    ).toString());

    if (fx[xph] && fx[xmh]) {
      return (fx[xph] - fx[xmh]) / (2 * h);
    } else if (fx[xph] && fx[xp2h]) {
      return (-3 * fx[x] + 4 * fx[xph] - fx[xp2h]) / (2 * h);
    } else if (fx[xmh] && fx[xm2h]) {
      return (-3 * fx[x] + 4 * fx[xmh] - fx[xm2h]) / (-2 * h);
    } else {
      throw new Error('broken!');
    }
  };
}

module.exports = ThreePointFormula;
