const FixedPoint = require('../FixedPoint');

const f = x => Math.cos(x);
const result = FixedPoint(f, 0.5, Math.pow(10, -5), 77);

console.log(result);
