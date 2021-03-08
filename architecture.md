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
