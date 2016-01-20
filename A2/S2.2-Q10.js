const FixedPoint = require('../FixedPoint');

const f = x => (2 * Math.pow(x, 3) + 25) / (3 * Math.pow(x, 2));
const result = FixedPoint(f, 2.9, Math.pow(10, -4), 100);

console.log(result);
