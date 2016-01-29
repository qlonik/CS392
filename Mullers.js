const math = require('mathjs');
const add = math.add;
const subt = math.subtract;
const mult = math.multiply;
const div = math.divide;
const sqrt = math.sqrt;
const pow = math.pow;
const abs = math.abs;
const comp = math.compare;

function Mullers(f, p0, p1, p2, tol, N0) {
  let h1 = p1 - p0;
  let h2 = p2 - p1;
  let delta1 = (f(p1) - f(p0)) / h1;
  let delta2 = (f(p2) - f(p1)) / h2;
  let d = (delta2 - delta1) / (h2 + h1);
  let i = 3;

  while (i <= N0) {
    const b = add(delta2, mult(h2, d));
    const D = sqrt(subt(pow(b, 2), mult(4, mult(f(p2), d))));
    let E;

    if (comp(abs(subt(b, D)), abs(add(b, D))) === -1) {
      E = add(b, D);
    } else {
      E = subt(b, D);
    }

    const h = div(mult(-2, f(p2)), E);
    const p = add(p2, h);

    if (abs(h) < tol) return [p, i];

    p0 = p1;
    p1 = p2;
    p2 = p;
    h1 = subt(p1, p0);
    h2 = subt(p2, p1);
    delta1 = div(subt(f(p1), f(p0)), h1);
    delta2 = div(subt(f(p2), f(p1)), h2);
    d = div(subt(delta2, delta1), add(h2, h1));
    i++;
  }

  return new Error(`Method failed after ${i - 1} iterations`);
}

module.exports = Mullers;
