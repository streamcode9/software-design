## Common
* switch operator is anti pattern ~ god object/function. prefer multiple functions over switch with parameters.

## Git
* https://cbea.ms/git-commit/
* 50/72 subject/line
  * log --oneline
  * commit --fixup
  * shortlog
  * bisect
  * format-patch
  * focus on why and how
  * focused commits - do one thing
  * write imperative subject (Add Remove Prune Handle ...) - (Fix usually useless)
* subject: if applied this commit will ... (remove deprecated method) 
* https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
* reset --patch
* https://www.conventionalcommits.org/en/v1.0.0/
* https://git-scm.com/docs/gitattributes
  * `* text=auto`

## Versioning
* https://semver.org/

## Dependencies
* dotnet nuget why .\Tests\Clients.Tests.csproj xunit.assert

## Hallmarks of a mature ecosystem
* Local dev and run loop
* Rich tooling (IDE + debugger)
* Strong logging support
* Reflection/introspection for dynamic work
* Ability to step into both 3rd-party and standard library code

## Debugging
* Endpoints tests are often дщыу original exception and miss stack trace. Replace/create simple middleware to debug tests related to API calls.
