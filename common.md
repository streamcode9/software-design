[Development process](https://github.com/streamcode9/software-design/blob/master/development-process.md)

[Architecture](https://streamcode9.github.io/code/architecture.html)

[Solution](https://streamcode9.github.io/code/solution.html)

ci/cd                                  | monitoring                     | automation                                       
---------------------------------------|--------------------------------|--------------------------------------------------
build tool (msbuild)                   | sentry                         | cmd                                              
teamcity, jenkins, sonarcube           | remote debug                   | bash                                       
octopus                                |                                |                                              
 
os                                     | network                        | cloud hosting                                
---------------------------------------|--------------------------------|--------------------------------------------------
win                                    | http                           | azure app service, vm                            
_                                      | _                              | web worker, web job, function                    
_                                      | _                              | cdn                                              

storage                                | ado.net                        | mvc + web api                                
---------------------------------------|--------------------------------|--------------------------------------------------
sql table, keys, indexes, sp           | ef (code first, fluent api)    | iis, di, mapper, swagger           
relationships, optimization            | fluentmigrator                 | cache, authentication, authorization 
transaction, isolation, acid           |                                | localization, configuration             
execution plan, profiler               |                                | performance, validation, security
scaling, normalization                 |                                | scale, serialization, model binding              
injection                              |                                | routing, request pipeline, session               
blob                                   |                                | filter, http handler/module                      

compiler, lang                         | design                         | architecture
---------------------------------------|--------------------------------|--------------------------------------------------
thread, collections                    | dry, kiss,                     | mvc, mvvm, mvp
exceptions, gc, gac                    | yagni, grasp                   | singleton = antipattern
reflection, IEnumerable vs IQuerable   | gof/enterprise patterns        | miscroservices
IDisposable                            | solid, oop, fp                 | ddd
string/stringBuilder, generics         |                                | uml, rest, soa
IEqualityComparer, IComparable         |                                | message queue, cqrs
operators, Object.methods, IClonable   |                                | 3 layer architecture 


tools                                  | testing            | html, css, js
---------------------------------------|--------------------|----------------------------------------------
 vs, resharper, notepad++              | moq, stub          | promises, typescript, scss, npm
 fiddler, chrome dev tools             | xunit              | localstorage, geolocation, cookies
 git, nuget, paket                     | selenium, specflow | d3, svg, kendo, use strict
 virtualBox                            | pyramid            | WebRTC, WebSockets

data structures | algo
----------------|---------
list, dict      | recursion
