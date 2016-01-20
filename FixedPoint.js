/**
 * @param {Function} f - function for approximation
 * @param {Number} appr - initial approximation
 * @param {Number} tol - tolerance (precision) of the answer
 * @param {Number} steps - maximum number of iterations
 *
 * @return {[Number, Number]} array with 2 numbers. First is a solution x of the
 * function f(x) = x near initial approximation appr with  precision tol and
 * second is an amount of iterations required to get the answer.
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
