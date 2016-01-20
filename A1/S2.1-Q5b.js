const Bisection = require('../Bisection');

const f = x => Math.pow(Math.E, x) - Math.pow(x, 2) + 3 * x - 2
const result = Bisection(f, 0, 1, Math.pow(10, -5), 100);

console.log(result);
