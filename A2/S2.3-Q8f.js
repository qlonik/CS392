const Secant = require('../Secant');

const f = x => Math.sin(x) - Math.exp(-x);
const firstResult = Secant(f, 0, 1, Math.pow(10, -5), 100);
const secondResult = Secant(f, 3, 4, Math.pow(10, -5), 100);
const thirdResult = Secant(f, 6, 7, Math.pow(10, -5), 100);

console.log(firstResult);
console.log(secondResult);
console.log(thirdResult);
