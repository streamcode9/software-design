# Core ideas

* discuss !!!
* each goal has price & profit
  * critical quality attibutes
  * metrics
  * automatization (e2e tests for critical pathes, linter, static analysis)
* code review
  * easy to read
  * pair code review
* tl = simple tasks + delegation + prioritization + book + speak aloud daily tasks
* form a list of conventions forming some guidelines and a set of automated checks to verify those conventions are not broken
* audit (system overview, requirements collection, patterns collection)
  * quality attributes and its priorities
* decisions log (ADR architecture decision record) - always know why something has happened
* control (automation, metrics)
  * limit the number of cross-context dependencies
  * tests for main/critical use cases (ideally integration tests - starting from UI interactions)
  * business rules processor on a strong type system
  * checklists (how to add a feature)
  * document all different ways you can add a new feature
  * limit the number of ways you can do that
    * ideally - having as few options as possible, every feature should be similar technically to others
* evolution (continuous aligning with business)
* Principles
  * delay necessity to make decisions (until it is critical and requirements are absolutely clear)
  * reduce the number of patterns
  * modularize the architecture so that smaller decisions are contained (local)
  * standardize systemic patterns and effects
  * reduce knowledge fragmentation
  * take into account continuous changes and evolution
* https://c4model.com/
* https://plantuml.com/ru/
* https://www.planttext.com/
* visibility = diagrams
  * Infrastructure map (how data flows through services/servers/network and how it scales)
  * Architectural layers map (what subsystems you have for storing/transforming data)
  * Bounded contexts (how your logical services are split and mapped to architecture)
  * Main use cases dataflows (CRUD operations, data streaming/pushes, auth, payments)


# Building blocks 

* browser
* web service
  * requestResponse
  * bidirectional
* backgorund service
* communications
  * queue
  * pubSub
* storage
  * tmp
    * cache
  * persistent
    * blob
    * relational sql
    * kv
    * search tree

# Patterns

* ddd
* anti-curruption layer
* repository
* cqrs

# Buzzwords

* dev process (jira, git, ci/cd, test, deploy, bug, hotfix, feature switch)
* lang
  * pattern matching
  * pure functions
* io
  * fs
  * network
* serialization
* parsing
* memory
  * gc
* multithreading & concurrency
  * csp (communicating sequential processes)
  * actors
  * cas (compare-and-swap)
  * stm (software transactional memory)
  * locks
  * multiversion concurrency control
* storage
  * relational (sql)
  * kv (cosmos)
  * graph (gremlin)
  * search index (tree)
  * migrations
  * indexes
  * partitioning
* types
* date & time
* encoding
* security
  * xss
  * cors
  * sandboxing
  * injection
  * keyVault keys rotation
* data structures
* algorithms
  * finite state machine
* test
* benchmark
* log
* errors
  * data loss
  * data duplication
  * system unavailable
  * data corruption
* high load
  * scaling
  * optimizations
  * back preassure
  * retry
  * tenants

```
websoket mqtt erl rocksdb Armstrong
Lear c hard way
scheme
blue-book-smalltalk
sml-harper
lisp-McCartney
https://github.com/o61
```

```
ArchiMate нотация + BPML
Jest
Буч, Ф Брукс, Кент Бэк - экстремальное программирование, Йордон Эдвард, Тепляков
https://www.manning.com/books/unit-testing
Kent Beck: Test-Driven Development: By Example (Addison-Wesley Professional, 2002)
Steve Freeman and Nat Pryce, Growing Object Oriented Software,Guided by Tests (Addison-Wesley Professional, 2009)
SICP
Книга Маслова по Перлу и книга Холомьёва по Хаскелю
https://www.manning.com/books/the-joy-of-javascript
https://bookauthority.org/books/new-functional-programming-books
F# for fun and profit
https://www.oreilly.com/library/view/functional-javascript/9781449360757/
funcional programming in javascript with underscore.js
https://eloquentjavascript.net/1st_edition/chapter6.html
```
