const ThreePointFormula = require('../ThreePointFormula');

const fx = {
  8.1: 16.94410,
  8.3: 17.56492,
  8.5: 18.19056,
  8.7: 18.82091,
};

const estimator = ThreePointFormula(fx);

console.log('f\'(8.1) =', estimator.Endpoint(8.1, 0.2));
console.log('f\'(8.3) =', estimator.Midpoint(8.3, 0.2));
console.log('f\'(8.5) =', estimator.Midpoint(8.5, 0.2));
console.log('f\'(8.7) =', estimator.Endpoint(8.7, -0.2));
