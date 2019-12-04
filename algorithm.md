Input -> Algo -> Output

Resources: time (amount of operations), memory

RAM-model of computations

RAM has memory cells. Each cell is a WORD with a size = W-bits and overflow flag/bit.

CPU: registers, arithmetic-logical device that can do diff operations

http://lisp-univ-etc.blogspot.com/2019/07/programming-algorithms-book.html

http://www.algorist.com/ - Steven Skienna's The Algorithm Design Manual

http://www.gigamonkeys.com/book/ - Practical Common Lisp
 
http://www.paulgraham.com/acl.html - ANSI Common Lisp

Big-O complexity
* constant-time (O(1))
* sublinear (logarithmic — O(log n))
* linear (O(n)) and superlinear (O(n * log n))
* higher-order polynomial (O(n^c), where c is some constant greater than 1)
* exponential (O(с^n), where с is usually 2 but, at least, greater than 1)
* plain lunatic complex (O(n!) and so forth)

Syntax
* self-evaluation: all literal constants (like 1, "hello", etc.) are evaluated to themselves. (built-in primitive types (1) or data structures ("hello")
* symbol evaluation (names of variables, functions, types or classes depending on the context)
* expression evaluation
  * build-in operator (axiom)
  * function
  * macro


http://www.paulgraham.com/onlisp.html

https://letoverlambda.com/

http://www.gigamonkeys.com/book/loop-for-black-belts.html


Data strcutures:
 * array, linked list, kvs
 * hash-table, string, tree, graph, functional, probabilistic, etc
 
```
/// PC
[ cache <-> CPU <-> registers ]  <-> memory <-> IO <-> world
von Neumann's bottleneck
register can store primitive integer numbers (integers proper, floats, characters) and memory address (pointer)
number of bits in a general-purpose register -> maximum memory address -> maximum amount of memory
```
 
