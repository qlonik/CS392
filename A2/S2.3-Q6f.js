const Newtons = require('../Newtons');

const f = x => Math.sin(x) - Math.exp(-x);
const fPrime = x => Math.cos(x) + Math.exp(-x);
const firstResult = Newtons(f, fPrime, 0.5, Math.pow(10, -5), 100);
const secondResult = Newtons(f, fPrime, 3.5, Math.pow(10, -5), 100);
const thirdResult = Newtons(f, fPrime, 6.5, Math.pow(10, -5), 100);

console.log(firstResult);
console.log(secondResult);
console.log(thirdResult);
