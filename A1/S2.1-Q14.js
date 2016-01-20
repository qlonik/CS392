const Bisection = require('../Bisection');

const f = x => Math.pow(x, 3) + x - 4
const result = Bisection(f, 1, 4, Math.pow(10, -3), 12);

console.log(result);
