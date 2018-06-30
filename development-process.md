## kanban

<img src="https://leankit.com/uploads/images/general/_xLarge/kanban_guide_print_KPO_bleed_board2.jpg" />

## scrum 

<img src="https://www.pmi.org/kasimage/d3e3f54a-6437-4c34-96c0-a8022b3e7a61/image01.jpg" />

* daily meeting
* code
  * conventions/styles/standards/review
  * configure ide (vs, resharper) or static code analysis tool (sonar cube, linter)
* test local
* git flow -> deploy -> test env
* grooming
* estimate
  * history for more precise estimation
  * create estimate -> planning poker -> add assumption -> discuss with BA and architect
* demo
* devs
  * designer -> UI/UX mock
  * front-end
  * back-end
  
```
business stakeholders ---> ba        -> business requirements ----> devs ---> qa manual ---> devops ---> release ---> qa automate
                      \--> architect -> tech reuirements -------/ 
```

## CI/CD
* build tool (msbuild)
* teamcity, jenkins
* octopus

## testing
* pyramid
* code coverage
* ui/functional/performance
