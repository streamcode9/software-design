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

Principles
- flat code
- readable name of variables and functions


* Hoare triples
* Embedded Design Principle
* Representable/Valid Principle
* Data Over Code Principle
* Algebraic Refactoring
  * sum and product types
  * data structure patterns
  * refactoring a program isomorphic to factoring polynomials in algebra
  * Liskov substitution principle
  * theory of subtyping
  
  
  Software: atom station, microprocessor, ai, game, bank, os, compiler, framework
  
  
  Design Patterns (https://sourcemaking.com/design_patterns):
  * Structural
  * Creational
  * Behavioral
    * Observer | EvenBus (events)
      * `pub(msg,channel)`
      * `sub(channel,callback)`
    * Chain of responsibility (message across the layers)
      * `handlers.reduce((ctx, module) => module.fun(args, ctx), context)`
    * Command (add functionality on a fly)
      * `command.exec(args)`
    * State
    * Mediator (late binding of the remote objects)
    * Strategy
    * Plugin
    * Visitor (rendering, bypass data structure like tree)
      * `elements.flat().forEach(elem => render(elem))`
    * Moment
    * Interpreter (BNF)
      * `program ::= message [ program ]`
      * `message ::= symbol [ «(» [ message [ «,» message ] ] «)» ]`
    * Template
      * `IModule { method(IArgs args); }`
      * `IModule module => module.method(args)`
      
