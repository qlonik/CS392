function Newtons(f, fPrime, appr, tol, steps) {
  let i = 1;

  while (i <= steps) {
    const p = appr - f(appr) / fPrime(appr);

    if (Math.abs(p - appr) < tol) return [p, i];

    appr = p;
    i++;
  }

  return new Error(`Method failed after ${i - 1} iterations`);
}

module.exports = Newtons;
