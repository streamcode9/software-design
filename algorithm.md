https://lisp-univ-etc.blogspot.com/2020/03/programming-algorithms-synchronization.html

Open MIT

Input -> Algo -> Output

Resources: time (amount of operations), memory

RAM-model of computations

RAM has memory cells. Each cell is a WORD with a size = W-bits and overflow flag/bit.

CPU: registers, arithmetic-logical device that can do diff operations

http://www.algorist.com/ - Steven Skienna's The Algorithm Design Manual

Big-O complexity
* constant-time (O(1))
* sublinear (logarithmic — O(log n))
* linear (O(n)) and superlinear (O(n * log n))
* higher-order polynomial (O(n^c), where c is some constant greater than 1)
* exponential (O(с^n), where с is usually 2 but, at least, greater than 1)
* plain lunatic complex (O(n!) and so forth)

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
 
data structure inside the memory:
* contiguous structure occupies a single chunk of memory (arrays and structs) 
* linked structure resides in different places (lists, trees, and graphs)

