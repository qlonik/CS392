const NaturalCubicSpline = require('../NaturalCubicSpline');

const x = [1940, 1950, 1960, 1970, 1980, 1990];
const fx = [132165000, 151326000, 179323000, 203302000, 226542000, 249633000];
const estimator = NaturalCubicSpline(x, fx);

console.log('f(1930) =', estimator(1930));
console.log('f(1965) =', estimator(1965));
console.log('f(2010) =', estimator(2010));
