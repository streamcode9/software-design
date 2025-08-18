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

## Versioning
* https://semver.org/

## Dependencies
* dotnet nuget why .\Tests\Clients.Tests.csproj xunit.assert
