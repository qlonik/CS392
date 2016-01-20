const Newtons = require('../Newtons');

const f = x => Math.exp(x) - 3 * Math.pow(x, 2);
const fPrime = x => Math.exp(x) - 6 * x;
const firstResult = Newtons(f, fPrime, 0.5, Math.pow(10, -5), 100);
const secondResult = Newtons(f, fPrime, 4, Math.pow(10, -5), 100);

console.log(firstResult);
console.log(secondResult);
