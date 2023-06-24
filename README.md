

# Principles

## Principle of using principles

- principles contradict each other

## Base principles

### Minimalism - use as less fetuses of the language/library/etc as possible

### DRY - Don't Repeat Yourself

[wiki](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)
[c2](http://wiki.c2.com/?DontRepeatYourself)
[deviq](http://deviq.com/don-t-repeat-yourself/)

### Loose Coupling and High Cohesion

Cohesion in software engineering is the degree to which the elements of a certain module belong together. 

If a change in one module results in many changes in another module then they are said to be highly coupled.

[SO](https://stackoverflow.com/q/14000762/805266)

## Derived principles

### Pure function
- return values are identical for identical arguments (no variation with local static variables, non-local variables, mutable reference arguments or input streams),
- no side effects (no mutation of local static variables, non-local variables, mutable reference arguments or input/output streams).

### SoC - Separation of Concerns

[wiki](https://en.wikipedia.org/wiki/Separation_of_concerns)

Improves Loose Coupling and High Cohesion.

- parsing module should not generate reports, reports module should not perform parsing
- per feature folders structure in solution

### Stable Dependencies

- The dependencies between software packages should be in the direction of the stability of the packages. That is, a given package should depend only on more stable packages.
- Application Layer -> Domain layer

[deviq](http://deviq.com/stable-dependencies/)

### Separate interface from implementation

### Information Hiding

- "The parsing module must not know that a report module exists"
- "The reporting module should not know about the parsing library used by the parsing module"

### SOLID

#### Single Responsibility

A component should have only one reason to change

#### Minimalist interfaces

[deviq](http://deviq.com/interface-segregation-principle/)

## Minimalism

### KISS - Keep It Simple Stupid

Explicit is Better Than Implicit.
Good code is Easy to delete.

### YAGNI - You Ain’t Gonna Need It

[deviq](http://deviq.com/yagni/)

### Don't fix what isn't broken

[c2](http://wiki.c2.com/?IfItIsWorkingDontChange)

### Minimal sample (to reproduce error or demo feature)

## Separation of everything

Quite a few principles revolve around the idea of Separation of Concerns:

- Separation of interface and implementation
- Separation of semantic code from utilities
- Separation of frequently modified code and stable
- Separation of data and presentation (here are variations of MVC)

## Anti patterns

### https://en.m.wikipedia.org/wiki/Cargo_cult_programming

### Everything is hardcoded and everything is parametrized by everything

Too bad or too good coupling respectively

### God Object

High cohesion - a lot of unrelated functionality jumbled together

[wiki](https://en.wikipedia.org/wiki/God_object) [c2](http://wiki.c2.com/?GodClass)

### Overengineering and Underengineering

During unengineering, all principles are violated. With overengineering, all principles are brought to the point of absurdity.

### Spaghetti code

- unstructured and difficult-to-maintain source code caused by lack of programming style rules

### Ravioli code

- code that comprises well-structured classes that are easy to understand in isolation, but difficult to understand as a whole

### Lasagna code

- code refers to code whose layers are so complicated and intertwined that making a change in one layer would necessitate changes in all other layers

### Growing programs

- anti-planing. Adding new features into empty or sample project step by step if needed
  without further planing of system evolution (architecture, features, etc) and building proper backbones of the system.
  Such code contains of workarounds and hacks.

### It does work!

### Pyramid of Doom

Nested callbacks:

```js
f.foreach(function (g) {
   g.foreach(function (h) {
      h.filter(...
```

### NIH - Not Invented Here

- re-implementation of the library function
- re-implementation of functionality already available in the project
- using a bad knee algorithm instead of an existing good one (re-invent a wheel)

### Duplicate Code vs Compressed Code

[wiki](https://en.wikipedia.org/wiki/Duplicate_code)

### Code Rot

[wiki](https://en.wikipedia.org/wiki/Software_rot)

### Technical Debt

- the implied cost of additional rework caused by choosing an easy solution now instead of using a better approach that would take longer

### Code Smell

- any characteristic in the source code of a program that possibly indicates a deeper problem

#### Data Clump

- any group of variables which are passed around together (in a clump) throughout various parts of the program

## Behavioral and methodological anti-patterns

### Programming by analogy

- google a similar solution on SO and fix it
- copy a similar piece from another place in the current project and fix it

### Helpless kitten

- developer does not know what he is doing and afraids everything
  He does not evolve because of lack of intellect or absence of environmental pressure (project or team interest, market needs, etc)

## Source control principles

- A single standard for naming commits
- One commit = one task, in particular:
   - separating unrelated changes into different commits
   - separation of refactorings and reformattings and semantic changes
- Single repo instead of multiple ones to track contract changes across system nodes

## Testing

* Protection against regressions
* Resistance to refactoring
* Fast feedback
* Maintainability
* AAA

### Black box vs white box testing

### Integration tests

### Regression tests 

### TDD и Tests First

- Arrange Act Assert (Given When Then)
- obj.verify(o => o.fun(args)).ones()

### Stubs and Mock Objects

### Randomized Property Testing

### BDD

- specflow
- [link](https://hiptest.com/blog/hiptest/getting-started-with-bdd-part-1/)

## Maintainence

- to replace the wrong with the right when a problem is detected is not our method. All dependencies that you use - you maintain them in fact. The result is more confidence in tools, and more confidence in coding, and more skill in dealing with problems.

## ?

- Shortening feedback loops is the most reliable way to improve any process. Identify which loop is the bottleneck, unclog it, rinse, repeat.
- azure function solution per project/product with multiple projects


