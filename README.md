

# Principles

## Core principles

### Thoroughness

There needs to be some thoroughness in the approach. And if you did something hastily and it miraculously works, even though it shouldn't, then it needs to be documented, and you must understand that this is only a temporary solution.
Imagine person made a few commits with typos that did something completely different from what was stated in the commit and change request descriptions, and neither the author nor the reviewer were bothered by it because build was green.

### Risk-driven approach

Systematically identify, assess, and mitigate risks to ensure project resilience, maintain information security, and achieve project objectives despite uncertainties in the external environment.

### Principles contradict each other

### Doing something, even if it’s not perfect today, is better than doing something perfectly but never

### Memento mori/prioritize

### Deliberate practice

Mass of information turns into essence — the large is condensed into the small.

### Always keep artitacts after your study/research/work

### Minimalism - use as less fetuses of the language/library/etc as possible

* use defaul OS/editor/etc apps and setup without customizations aka vanilla style
* minimal code, native API, minimal latency, ergonomics, zero deps

### Loose Coupling and High Cohesion

Cohesion in software engineering is the degree to which the elements of a certain module belong together. 

If a change in one module results in many changes in another module then they are said to be highly coupled.

[SO](https://stackoverflow.com/q/14000762/805266)

### Explicit is Better Than Implicit

### Easy code introspection

### Don't fix what isn't broken

[c2](http://wiki.c2.com/?IfItIsWorkingDontChange)

### Minimal sample (to reproduce error or demo feature)


## Anti patterns

### https://en.m.wikipedia.org/wiki/Cargo_cult_programming

### Everything is hardcoded and everything is parametrized by everything

Too bad or too good coupling respectively

### God Object

High cohesion - a lot of unrelated functionality jumbled together

[wiki](https://en.wikipedia.org/wiki/God_object) [c2](http://wiki.c2.com/?GodClass)

### Overengineering and Underengineering

During unengineering, all principles are violated. With overengineering, all principles are brought to the point of absurdity.


### Growing programs

anti-planing. Adding new features into empty or sample project step by step if needed
  without further planing of system evolution (architecture, features, etc) and building proper backbones of the system.
  Such code consist of workarounds and hacks.

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

the implied cost of additional rework caused by choosing an easy solution now instead of using a better approach that would take longer

### Data Clump

any group of variables which are passed around together (in a clump) throughout various parts of the program

## Behavioral and methodological anti-patterns

### Programming by analogy

- google a similar solution on SO and fix it
- copy a similar piece from another place in the current project and fix it

### Helpless kitten

developer does not know what he is doing and afraids everything
  He does not evolve because of lack of intellect or absence of environmental pressure (project or team interest, market needs, etc)

## Source control principles

- A single standard for naming commits
- One commit = one task, in particular:
   - separating unrelated changes into different commits
   - separation of refactorings and reformattings and semantic changes
- Single repo instead of multiple ones to track contract changes across system nodes


## Maintainence

- to replace the wrong with the right when a problem is detected is not our method. All dependencies that you use - you maintain them in fact. The result is more confidence in tools, and more confidence in coding, and more skill in dealing with problems.
- Shortening feedback loops is the most reliable way to improve any process. Identify which loop is the bottleneck, unclog it, rinse, repeat.


