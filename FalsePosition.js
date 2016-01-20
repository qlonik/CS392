/**
 * Function which approximates the equation f(x) = 0 with the specified
 * tolerance given that f is continuous function on the interval [p0, p1] where
 * f(p0) and f(p1) have opposite signs.
 *
 * @param {Function} f - function for approximation
 * @param {Number} p0 - first given approximation
 * @param {Number} p1 - second given approximation
 * @param {Number} tol - tolerance (precision) of the answer
 * @param {Number} steps - maximum number of iterations
 *
 * @returns {[Number, Number]|Error} Array with 2 numbers - approximate solution
 * x and number of steps required to find the solution
 */
function FalsePosition(f, p0, p1, tol, steps) {
  let i = 2;
  let q0 = f(p0);
  let q1 = f(p1);

  while (i <= steps) {
    const p = p1 - q1 * (p1 - p0) / (q1 - q0);

    if (Math.abs(p - p1) < tol) return [p, i];

    const q = f(p);

    if (q * q1 < 0) {
      p0 = p1;
      q0 = q1;
    }

    p1 = p;
    q1 = q;
    i++;
  }

  return new Error(`Method failed after ${i - 1} iterations`);
}

module.exports = FalsePosition;
