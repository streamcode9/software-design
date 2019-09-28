```
is_http = (== "http://") . take 7
process_url = \url -> print (url ++ "\n" ++ get_url url)

map(process_url,
    filter(is_http,
           split(read_file(open("urls.txt")))))
```

* p1();p2();p3(); p1 >>= (\ _ -> p2) >>= (\ _ -> p3)
* f3(f2(f1()))    pure f1 >>= (pure . f2) >>= (pure . f3)

```
// John backus
c = 0
for (var i = 0; i < n; i++) {
    c += a[i]*b[i]
}

def dotP = (insert +) • (applyToAll x) • transpose
```

* Visitor pattern, multimethods, extensions, typeclasses, object algebras
* semi group and monoid = composite pattern - simlify entities composition
```
var a = http(url1)
var b = http(url2)
var c = a + b
```
* functors and monads simplify difinition of calculation steps in context
```
person?.residence?.address?.street
// optional chaining or Maybe monad
```
* algebra = many entities and operations
* curry
