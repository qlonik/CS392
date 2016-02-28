const NaturalCubicSpline = require('../NaturalCubicSpline');

const x = [1950, 1960, 1970, 1980, 1990, 2000];
const fx = [151326000, 179323000, 203302000, 226542000, 249633000, 281422000];
const estimator = NaturalCubicSpline(x, fx);

console.log('f(1940) =', estimator(1940));
console.log('f(1975) =', estimator(1975));
console.log('f(2020) =', estimator(2020));
