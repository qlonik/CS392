/**
 * Function which approximates the equation f(x) = 0 given the initial
 * approximations p0 and p1 with the specified tolerance.
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
function Secant(f, p0, p1, tol, steps) {
  let i = 2;
  let q0 = f(p0);
  let q1 = f(p1);

  while (i <= steps) {
    const p = p1 - q1 * (p1 - p0) / (q1 - q0);

    if (Math.abs(p - p1) < tol) return [p, i];

    p0 = p1;
    q0 = q1;
    p1 = p;
    q1 = f(p);
    i++;
  }

  return new Error(`Method failed after ${i - 1} iterations`);
}

module.exports = Secant;
