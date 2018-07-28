[Development process](https://github.com/streamcode9/software-design/blob/master/development-process.md)

[Architecture](https://streamcode9.github.io/code/architecture.html)

[Solution](https://streamcode9.github.io/code/solution.html)

ci/cd                                  | monitoring                     | automation                                       
---------------------------------------|--------------------------------|--------------------------------------------------
build tool (msbuild)                   | logs(sentry)                   | cmd                                              
teamcity, jenkins, sonarcube           | debug                          | bash                                       
octopus                                |                                |                                              
 
os                                     | network                        | cloud hosting                                
---------------------------------------|--------------------------------|--------------------------------------------------
win                                    | http                           | azure app service, vm                            
_                                      | _                              | web worker, web job, function                    
_                                      | _                              | cdn                                              

storage                                | ado.net                        | mvc + web api                                
---------------------------------------|--------------------------------|--------------------------------------------------
sql table, keys, indexes, sp, function | ef (code first, fluent api)    | iis, di, mapper, documentation (swagger)         
trigger, view, relationships           | fluentmigrator                 | cache, authentication, authorization, validation 
transaction, isolation, acid           |                                | localization, configuration, security            
execution plan, profiler, optimization |                                | integration with 3rd-party system, performance   
scaling (partitioning), normalization  |                                | scale, serialization, model binding              
injection                              |                                | routing, request pipeline, session               
blob                                   |                                | filter, http handler/module                      

compiler, lang                         | design                         | architecture
---------------------------------------|--------------------------------|--------------------------------------------------
thread, collections                    | dry, kiss,                     | mvc, mvvm, mvp
exceptions, gc, gac                    | yagni, grasp                   | singleton = antipattern
reflection, IEnumerable vs IQuerable   | gof/enterprise patterns        | aspect oriented
IDisposable                            | solid, oop, fp                 | metaprogramming
string/stringBuilder, generics         |                                | uml, rest, soa
IEqualityComparer, IComparable         |                                | message queue, cqrs, miscroservices
operators, Object.methods, IClonable   |                                | 3 layer architecture, ddd


tools                                  | testing            | html, css, js
---------------------------------------|--------------------|----------------------------------------------
 vs+resharper, notepad++               | moq, stub          | promises, typescript, scss, use strict
 fiddler, chrome dev tools, virtualBox | xunit              | localstorage, geolocation, cookies
 git                                   | selenium, specflow | d3, svg, kendo
                                       | pyramid            | WebRTC, WebSockets, webworker

data structures | algo
----------------|---------
list, dict      | recursion
