[Development process](https://github.com/streamcode9/software-design/blob/master/development-process.md)

[Architecture](https://streamcode9.github.io/code/architecture.html)

[Solution](https://streamcode9.github.io/code/solution.html)

ci/cd                                  | monitoring                     | automation                                       
---------------------------------------|--------------------------------|--------------------------------------------------
build tool (msbuild)                   | monitoring, health check       | cmd                                              
teamcity, jenkins                      | debug                          | powershell                                       
octopus                                | logs                           | bash                                             

os                                     | network                        | cloud hosting                                
---------------------------------------|--------------------------------|--------------------------------------------------
win                                    | http                           | azure app service, vm                            
_                                      | _                              | web worker, web job, function                    
_                                      | _                              | cdn                                              

storage                                | ado.net, ef                    | mvc + web api                                
---------------------------------------|--------------------------------|--------------------------------------------------
sql table, keys, indexes, sp, function | code first                     | iis, di, mapper, documentation (swagger)         
trigger, view, relationships           | fluent api                     | cache, authentication, authorization, validation 
transaction, isolation, acid           | data annotations               | localization, configuration, security            
execution plan, profiler, optimization | migrations                     | integration with 3rd-party system, performance   
scaling (partitioning), normalization  |                                | scale, serialization, model binding              
injection                              |                                | routing, request pipeline, session               
blob                                   |                                | filter, http handler/module                      

compiler, lang                         | design                         | architecture
---------------------------------------|--------------------------------|--------------------------------------------------
thread, collections                    | dry, kiss,                     | mvc, mvvm, mvp
exceptions, gc, gac                    | yagni, grasp                   | singleton = antipattern
reflection, IEnumerable vs IQuerable   | gof/enterprise patterns        | aspect oriented
IDisposable                            | solid, oop, fp                 | metaprogramming
string/stringBuilder, generics         |                                | uml, rest. soa
IEqualityComparer, IComparable         |                                | message queue, cqrs, miscroservices
operators, Object.methods, IClonable   |                                | 3 layer architecture, ddd


#### tools
* vs+resharper, notepad++ 
* fiddler, chrome dev tools, virtualBox
* git
#### testing
* mock, stub, libs (moq, nunit, xunit, nsubstitute, selenium/webdriver, specflow)
* pyramid
* code coverage
* ui/functional/performance
#### html, css, js
* promises, typescript, scss, use strict
* localstorage, geolocation, cookies
* d3, svg, kendo
* WebRTC, WebSockets, webworker
#### data structures, algo
* recursion
#### petri nets, deniok.dreamwidth.org, youtube.com/user/bravit111, Валерий Исаев, automath, http://www.cs.ru.nl/~freek/100/index.html, Robin Milner, Robert Harper, Calculus_of_constructions, mltt, Categorical_abstract_machine, F-algebra, Coq, Воеводский, github.com/mortberg, https://home.sandiego.edu/~shulman/papers/index.html, github.com/felixwellen, semantic.vision
