- [ ] .NET
- [ ] Web
- [ ] Webforms
- [ ] MVC
- [ ] WPF
- [ ] WinForm
- [ ] Back-End
- [ ] Web-Services and WCF
- [ ] RESTful services and WebAPI
- [ ] Data Access
- [ ] UX dev
- [ ] UX design
- [ ] Database 
- [ ] MS SQL Server

ORM: EntityFramework

DB mirgations: FluentMigrator

SSDT, dacpac

Azure: webapp, job scheduler, db, app insights, blob, event hub, notification hub, api managment, service bus, etc.

Visual Studio DB project

IoC: Autofac, Autofac.WebApi2

Other: Microsoft.ApplicationInsights, Microsoft.IdentityModel, Microsoft.CodeDom, Microsoft.Net.Compilers

Nuget:
* manage .config files: SimpleConfig
* validation: FluentValidation, FluentAssertions
* mapping objects: AutoMapper
* unit testing: NSubstitute, NUnit, Moq
* IoC/DI: Autofac

Integration/End-to-end(E2E): SpecFlow

Debug:
* create/analyze dumps with ClrMD, Task Manager, procdump, Windows Error Reporting, DebugDiag (for IIS)

Event Sourcing (git, redux)

Authentication and authorization: jwt, jwt.io

Centralized logging. Correlation ID

Versioning (API, config, nuget packages, services, DB, messages, etc)

Healthckeck and monitoring

Configuration service instead of hardcoded values / configuration values

Store the passwords in KeyVault

Blue&Green or Red&Black deployment

Parallel test execution, small execution time

Git flow

DevOps, CI/CD, d = delivery or deployment, Jenkins, Octopus, SonarQube, PowerShell

Challenges:
* Release branches for nuget packages. Nuget packages make micro services tightly coupled
* Dependencies hell (different services have different nuget packages versions)
* Loose coupling (Autofac and interfaces) makes navigation hard
* Concurrent read/write, state is cached in EntityFramework context
* Test with many micro services and service bus
* Messages order, resend, disappearing during redeploy
* Logs with correlation ID 

Testing:
* white box - unit - dev
* black box - integration - qa
* black box - e2e - qa
* UI tests - Selenium - qa
