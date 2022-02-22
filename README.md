

# Principles

## Принципы пользования принципами

- принципы противоречат друг другу

## Базовые принципы

### DRY - Don't Repeat Yourself

[wiki](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)
[c2](http://wiki.c2.com/?DontRepeatYourself)
[deviq](http://deviq.com/don-t-repeat-yourself/)

### Loose Coupling and High Cohesion

Cohesion in software engineering is the degree to which the elements of a certain module belong together. 

If a change in one module results in many changes in another module then they are said to be highly coupled.

[SO](https://stackoverflow.com/q/14000762/805266)

## Производные принципы

### SoC - Separation of Concerns

[wiki](https://en.wikipedia.org/wiki/Separation_of_concerns)

Улучшает Loose Coupling and High Cohesion.

- "модуль парсинга не должен заниматься отчётами, а модуль отчётов - парсингом"
- per feature folders structure in solution

### Stable Dependencies

- The dependencies between software packages should be in the direction of the stability of the packages. That is, a given package should depend only on more stable packages.
- Application Layer -> Domain layer

[deviq](http://deviq.com/stable-dependencies/)

### Отделение интерфейса от реализации

### Information Hiding

- "Модуль парсинга не должен знать о том, что существует модуль отчётов"
- "Модуль отчётов не должен знать о используемой модулем парсинга библиотеке парсинга"

### SOLID

#### Single Responsibility

A component should have only one reason to change

#### Узкие интерфейсы

[deviq](http://deviq.com/interface-segregation-principle/)

## Minimalism

### KISS - Keep It Simple Stupid

Explicit is Better Than Implicit.
Good code is Easy to delete.

### YAGNI - You Ain’t Gonna Need It

[deviq](http://deviq.com/yagni/)

### Не чини то, что не поломано

[c2](http://wiki.c2.com/?IfItIsWorkingDontChange)

## Разделение всего и вся

Достаточно много принципов крутится вокруг идеи Separation of Concerns:

- Разделение интерфейса и реализациии
- Разделение смыслового кода от утилит
- Разделение часто модифицированного кода и стабильного
- Разделение данных и представления (сюда же вариации MVC)

## Антипаттерны

### Всё захардкожено и Всё параметризовано всем

Слишком плохой или слишком хороший coupling соответственно

### God Object

Антипаттерн High cohesion - много несвязанного функционала намешано в кучу

[wiki](https://en.wikipedia.org/wiki/God_object) [c2](http://wiki.c2.com/?GodClass)

### Overengineering and Underengineering

При андеинжиниринге все принципы нарушены. При оверинжиниринге все принципы доведены до абсурда.

### Spaghetti code

- unstructured and difficult-to-maintain source code caused by lack of programming style rules

### Ravioli code

- code that comprises well-structured classes that are easy to understand in isolation, but difficult to understand as a whole

### Lasagna code

- code refers to code whose layers are so complicated and intertwined that making a change in one layer would necessitate changes in all other layers

### Выращиваение программ

- anti-planing. Adding new features into empty or sample project step by step if needed
  without further planing of system evolution (architecture, features, etc) and building proper backbones of the system.
  Such code contains of workarounds and hacks.

### Оно же работает

### Pyramid of Doom

Вложенные коллбеки. В стиле

```js
f.foreach(function (g) {
   g.foreach(function (h) {
      h.filter(...
```

### NIH - Not Invented Here

- повторная реализация библиотечной функции
- повторная реализация функциональности, уже имеющейся в проекте
- использование плохого наколенного алгоритма вместо имеющегося хорошего

### Duplicate Code vs Compressed Code

[wiki](https://en.wikipedia.org/wiki/Duplicate_code)

### Code Rot

[wiki](https://en.wikipedia.org/wiki/Software_rot)

### Technical Debt

- the implied cost of additional rework caused by choosing an easy solution now instead of using a better approach that would take longer

### Code Smell

- any characteristic in the source code of a program that possibly indicates a deeper problem

#### Data Clump

- any group of variables which are passed around together (in a clump) throughout various parts of the program

## Поведенческие и методологические антипаттерны

### Программирование по аналогии

- выгуглить аналогичное решение на SO и поправить
- скопировать аналогичный кусок из другого  места текущего проекта и поправить

### Беспомощный котёнок

- developer does not know what he is doing and afraids everything
  He does not evolve because of lack of intellect or absence of environmental pressure (project or team interest, market needs, etc)

## Принципы сорс-контрола

- Единый стантарт именования коммитов
- Один коммит = одна задача, в частности:
  - разделение несвязанных изменений по разным коммитам
  - разделение рефакторингов и реформатирований и смысловых изменений


## Testing

* Protection against regressions
* Resistance to refactoring
* Fast feedback
* Maintainability
* AAA

### Black box vs white box testing

### Интеграционные тесты

### Регрессионные тесты

### TDD и Tests First

- Arrange Act Assert (Given When Then)
- obj.verify(o => o.fun(args)).ones()

### Stubs and Mock Objects

### Randomized Property Testing

### BDD

- specflow
- [link](https://hiptest.com/blog/hiptest/getting-started-with-bdd-part-1/)

## Maintainence

- заменять неправильное на правильное при обнаружении проблемы — это не наш метод. Все либы которые используешь — ты их и мейнтейнишь по факту. В результате больше уверенности в инструментах, и больше уверенности при написании кода, и больше навыков по разбирательствам с проблемами.


