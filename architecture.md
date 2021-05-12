# Core ideas

* Architecture is a decision-making and *delegation* system for *complexity* and *risk* management.
* Architecture helps with the indeterminism tackling.
* Engineering - context, restrictions, trade-offs
* Processes
  * audit (system overview, requirements collection, patterns collection)
    * quality attributes and its priorities
  * decisions log (ADR architecture decision record)
  * control (automation, metrics)
    * checklists (how to add a feature)
  * evolution (continuous aligning with business)
* Conway's law
* Refactoring
* Principles
  * delay necessity to make decisions (until it is critical and requirements are absolutely clear)
  * reduce the number of patterns
  * modularize the architecture so that smaller decisions are contained (local)
  * standardize systemic patterns and effects
  * reduce knowledge fragmentation
  * take into account continuous changes and evolution
* Communication skills, лид должен привносить ясность в проект
* DDD
* https://c4model.com/

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


http://tiarkrompf.github.io/notes/?/smooth-tree-animation/aside13

I want to have a list of conventions forming some guidelines,
and a set of automated checks to verify those conventions are not broken

https://plantuml.com/ru/

https://www.planttext.com/

Infrastructure map (how data flows through services/servers/network and how it scales)

Architectural layers map (what subsystems you have for storing/transforming data)

Bounded contexts (how your logical services are split and mapped to architecture)

Main use cases dataflows (CRUD operations, data streaming/pushes, auth, payments)


Limit the number of cross-context dependencies

Tests for main/critical use cases (ideally integration tests - starting from UI interactions)

document all different ways you can add a new feature.

limit the number of ways you can do that.

Ideally - having as few options as possible, every feature should be similar technically to others.

https://www.youtube.com/watch?v=6m4XPje76WU

https://www.youtube.com/watch?v=_Kex5hwGE-w
