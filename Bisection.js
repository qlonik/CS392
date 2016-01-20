/**
 * Function which solves the equation f(x) = 0 on interval [a, b] and returns
 * the solution and the amount of steps required to find the solution with
 * specified tolerance.
 *
 * @param {Function} f - function for approximation
 * @param {Number} a - lower bound for the solution
 * @param {Number} b - upper bound for the solution
 * @param {Number} tol - tolerance (precision) of the answer
 * @param {Number} steps - maximum number of iterations
 *
 * @return {[Number, Number]|Error} array with 2 numbers - solution x and amount
 * of steps.
 */
function Bisection(f, a, b, tol, steps) {
  let i = 1;
  let fa = f(a);

  while (i <= steps) {
    const p = (a + b) / 2;
    const fp = f(p);

    if (fp === 0 || (b - a) / 2 < tol) return [p, i];
    if (fa * fp > 0) {
      a = p;
      fa = fp;
    } else {
      b = p;
    }

    i++;
  }

  return new Error(`Method failed after ${i - 1} iterations`);
}

module.exports = Bisection;
