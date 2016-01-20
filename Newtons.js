/**
 * Function which approximates the equation f(x) = 0 near the initial
 * approximation and returns found approximation and the amount of steps
 * required to find the approximation with specified tolerance.
 *
 * @param {Function} f - function for approximation
 * @param {Function} fPrime - derivative of function f. Algorithm cannot find
 * derivatives by itself, so we need to pass function which is a derivative of
 * function f.
 * @param {Number} appr - initial approximation
 * @param {Number} tol - tolerance (precision) of the answer
 * @param {Number} steps - maximum number of iterations
 *
 * @return {[Number, Number]|Error} Array with 2 numbers - solution x and the
 * amount of steps.
 */
function Newtons(f, fPrime, appr, tol, steps) {
  let i = 1;

  while (i <= steps) {
    const p = appr - f(appr) / fPrime(appr);

    if (Math.abs(p - appr) < tol) return [p, i];

    appr = p;
    i++;
  }

  return new Error(`Method failed after ${i - 1} iterations`);
}

module.exports = Newtons;
