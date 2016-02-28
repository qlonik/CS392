const ThreePointFormula = require('../ThreePointFormula');

const L = 0.98;
const R = 0.142;
const fx = {
  1.00: 3.10,
  1.01: 3.12,
  1.02: 3.14,
  1.03: 3.18,
  1.04: 3.24,
};
const didt = ThreePointFormula(fx);
const E = t => L * didt(t, 0.01) + R * fx[t];

console.log('E(1.00) =', E(1.00));
console.log('E(1.01) =', E(1.01));
console.log('E(1.02) =', E(1.02));
console.log('E(1.03) =', E(1.03));
console.log('E(1.04) =', E(1.04));
