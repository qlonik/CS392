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
      return (-3 * fx[x] + 4 * fx[x + h] - fx[x + 2 * h]) / (2 * h);
    },
    /**
     *
     * @param x
     * @param h
     * @returns {number}
     */
    Midpoint: function(x, h) {
      return (fx[x + h] - fx[x - h]) / (2 * h);
    },
  }
}

module.exports = ThreePointFormula;
