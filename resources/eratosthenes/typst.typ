#let sieve(n) = {
  let is-prime = (false, false) + (true,)*(n - 1)
  for i in range(2, int(calc.sqrt(n)) + 1) {
    if is-prime.at(i) {
      for j in range(i * i, n + 1, step: i) {
        is-prime.at(j) = false
      }
    }
  }
  is-prime.enumerate()
    .filter(it => it.at(1))
    .map(it => str(it.at(0)))
    .join(", ")
}

#sieve(50)
