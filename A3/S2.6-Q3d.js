const math = require('mathjs');
const add = math.add;
const mult = math.multiply;
const pow = math.pow;

const Mullers = require('../Mullers');

const f = x => add(add(add(pow(x, 4), mult(2, pow(x, 2))), mult(-1, x)), -3);
const firstResult = Mullers(f, -1, 1, 0, pow(10, -4), 100);
const secondResult = Mullers(f, -3, -2.5, -2, pow(10, -4), 100);
const thirdResult = Mullers(f, -1, 0, 1, pow(10, -4), 100);

if (typeof firstResult[0] === 'object') {
  firstResult[0] = firstResult[0].toString();
}
if (typeof secondResult[0] === 'object') {
  secondResult[0] = secondResult[0].toString();
}
if (typeof thirdResult[0] === 'object') {
  thirdResult[0] = thirdResult[0].toString();
}

console.log(firstResult);
console.log(secondResult);
console.log(thirdResult);
