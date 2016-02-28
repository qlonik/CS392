const math = require('mathjs');

/**
 *
 * @param fx
 * @returns {{Endpoint: Endpoint, Midpoint: Midpoint}}
 * @constructor
 */
function ThreePointFormula(fx) {
  'use strict';

  return {
    /**
     *
     * @param x
     * @param h
     * @returns {number}
     */
    Endpoint: function(x, h) {
      const xh = parseFloat(math.add(
        math.bignumber(x), math.bignumber(h)
      ).toString());
      const x2h = parseFloat(math.add(
        math.bignumber(x), math.multiply(2, math.bignumber(h))
      ).toString());

      return (-3 * fx[x] + 4 * fx[xh] - fx[x2h]) / (2 * h);
    },
    /**
     *
     * @param x
     * @param h
     * @returns {number}
     */
    Midpoint: function(x, h) {
      const xph = parseFloat(math.add(
        math.bignumber(x), math.bignumber(h)
      ).toString());
      const xmh = parseFloat(math.subtract(
        math.bignumber(x), math.bignumber(h)
      ).toString());

      return (fx[xph] - fx[xmh]) / (2 * h);
    },
  }
}

module.exports = ThreePointFormula;
