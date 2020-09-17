```
https://ru.wikipedia.org/wiki/%D0%9F%D1%80%D0%BE%D0%B4%D0%BE%D0%BB%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5_(%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%82%D0%B8%D0%BA%D0%B0)
https://en.wikipedia.org/wiki/Delimited_continuation
// Nondeterminism
choose(3, 4) // => [3,4]
withNondeterminism(() => choose(3,4) * choose(5,6)) // => new [] {15,18,20,24}
// Delimited Control/Continuation
1 + reset { x = shift(k => 1 + k(k 5)); return x*2 }
1 + reset { 1 + (x => x*2) (x => x*2) 5 } // => 22
https://github.com/jkoppel/thermometer-continuations
```
