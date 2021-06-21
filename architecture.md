# Core ideas

* Processes
  * form a list of conventions forming some guidelines and a set of automated checks to verify those conventions are not broken
  * audit (system overview, requirements collection, patterns collection)
    * quality attributes and its priorities
  * decisions log (ADR architecture decision record)
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
* Communication skills, лид должен привносить ясность в проект
* DDD
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


