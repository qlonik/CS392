const Bisection = require('../Bisection');

const f = x => Math.pow(x, 2) - 3;
const result = Bisection(f, 0, 3, Math.pow(10, -4), 100);

console.log(result);
