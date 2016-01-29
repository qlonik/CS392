const math = require('mathjs');
const add = math.add;
const mult = math.multiply;
const pow = math.pow;

const Mullers = require('../Mullers');

const f = x => add(add(pow(x, 3), mult(-2, pow(x, 2))), -5);
const firstResult = Mullers(f, -3, -1.5, 0, pow(10, -4), 100);
const secondResult = Mullers(f, 0, 1.5, 3, pow(10, -4), 100);

if (typeof firstResult[0] === 'object') {
  firstResult[0] = firstResult[0].toString();
}
if (typeof secondResult[0] === 'object') {
  secondResult[0] = secondResult[0].toString();
}

console.log(firstResult);
console.log(secondResult);
