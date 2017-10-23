

# haskell-cheatsheet

## Принципы пользования принципами

- принципы противоречат друг другу

## Базовые принципы

### DRY - Don't Repeat Yourself

[wiki](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)
[c2](http://wiki.c2.com/?DontRepeatYourself)
[deviq](http://deviq.com/don-t-repeat-yourself/)

## Loose Coupling and High Cohesion

Cohesion in software engineering is the degree to which the elements of a certain module belong together. 

If a change in one module results in many changes in another module then they are said to be highly coupled.

[SO](https://stackoverflow.com/q/14000762/805266)

## Производные принципы

### SoC - Separation of Concerns

[wiki](https://en.wikipedia.org/wiki/Separation_of_concerns)

Улучшает Loose Coupling and High Cohesion.

- "модуль парсинга не должен заниматься отчётами, а модуль отчётов - парсингом"

### Отделение интерфейса от реализации

### Узкие интерфейсы

### Information Hiding

- "Модуль парсинга не должен знать о том, что существует модуль отчётов"
- "Модуль отчётов не должен знать о используемой модулем парсинга библиотеке парсинга"

## Антипаттерны

### Всё захардкожено и Всё параметризовано всем

Слишком плохой или слишком хороший coupling соответственно

### God Object

Антипаттерн High cohesion - много несвязанного функционала намешано в кучу

[wiki](https://en.wikipedia.org/wiki/God_object) [c2](http://wiki.c2.com/?GodClass)

### Overengineering and Underengineering

При андеинжиниринге все принципы нарушены. При оверинжиниринге все принципы доведены до абсурда.

### Spaghetti and Ravioli Code

### Оно же работает

### Не чини то, что не поломано

[c2](http://wiki.c2.com/?IfItIsWorkingDontChange)

### NIH - Not Invented Here

- повторная реализация библиотечной функции
- повторная реализация функциональности, уже имеющейся в проекте
- использование плохого наколенного алгоритма вместо имеющегося хорошего

### Duplicate Code vs Compressed Code

[wiki](https://en.wikipedia.org/wiki/Duplicate_code)

### Code Rot

[wiki](https://en.wikipedia.org/wiki/Software_rot)

### Technical Debt

### Data Clump

[wiki](https://en.wikipedia.org/wiki/Data_Clump_(Code_Smell))

## Поведенческие и методологические антипаттерны

### Программирование по аналогии

- выгуглить аналогичное решение на SO и поправить
- скопировать аналогичный кусок из другого  места текущего проекта и поправить

### Беспомощный котёнок

## Принципы тестирования

### Black box vs white box testing

### Интеграционные тесты

### Регрессионные тесты

### TDD и Tests First

### Stubs and Mock Objects

### Randomized Property Testing

