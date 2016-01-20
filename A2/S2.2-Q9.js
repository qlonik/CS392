const FixedPoint = require('../FixedPoint');

const f = x => (Math.pow(x, 2) + 3) / (2 * x);
const result = FixedPoint(f, 1, Math.pow(10, -4), 100);

console.log(result);
