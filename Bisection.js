/**
 * @param {Function} f - function for approximation
 * @param {Number} a - lower bound for the solution
 * @param {Number} b - upper bound for the solution
 * @param {Number} tol - tolerance (precision) of the answer
 * @param {Number} steps - maximum number of iterations
 *
 * @return {[Number, Number]} array with 2 numbers. First is a solution x of the
 * function f(x) = 0 on interval [a, b] with precision tol and second is an
 * amount of iterations required to get the answer.
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
