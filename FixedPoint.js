/**
 * Function which approximates the equation f(x) = x near the initial
 * approximation and returns found approximation and the amount of steps
 * required to find the approximation with specified tolerance.
 *
 * @param {Function} f - function for approximation
 * @param {Number} appr - initial approximation
 * @param {Number} tol - tolerance (precision) of the answer
 * @param {Number} steps - maximum number of iterations
 *
 * @return {[Number, Number]|Error} Array with 2 numbers - solution x and amount
 * of steps.
 */
function FixedPoint(f, appr, tol, steps) {
  let i = 1;

  while (i <= steps) {
    const p = f(appr);

    if (Math.abs(p - appr) < tol) return [p, i];

    appr = p;
    i++;
  }

  return new Error(`Method failed after ${i - 1} iterations`);
}

module.exports = FixedPoint;
