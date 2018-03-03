class Program {}

/*
** Single Responsibility Principle
* у класса/модуля должна быть лишь одна причина для изменения.
* Tackling the complexity
* Нельзя объять необъятное.
* Гибкость приводит к увеличению сложности.
*/

/*
** Open-Closed Principle
* программные сущности (классы, модули, функции и т. п.) должны быть
* открытыми для расширения (изменения реализации, переопределения поведения за счет создания наследников),
* но закрытыми для модификации (стабильный интерфейс).
* Эффективные проекты контролируют изменения; неэффективные проекты находятся под контролем изменений.
*/

/*
** Liskov Substitution Principle
* должна существовать возможность вместо базового типа подставить любой его подтип.
* В каких пределах может изменяться поведение методов, переопределенных в производных классах, 
* чтобы между классами сохранялось отношение «ЯВЛЯЕТСЯ» (IS-A relationship = inheritance).
* Child is an instance of parent (Subtype Inheritance).
*/

/*
** Interface Segregation Principle
* клиенты не должны вынужденно зависеть от методов, которыми не пользуются.
* Нужен простой и слабосвязный код. Требуй меньше, но гарантируй больше.
*/

/*
** Dependency Inversion Principle
* модули верхнего уровня не должны зависеть от модулей нижнего уровня. И те и другие должны зависеть от абстракций.
* Большое число зависимостей класса говорит о проблемах в его дизайне.
* Одна группа классов реализует некоторый набор интерфейсов, а другая — принимает эти интерфейсы в качестве аргументов конструктора.
* Название принципа отражает нетипичность направления зависимостей: 
* классы нижнего уровня определяют некоторый контракт, которому должны следовать классы верхнего уровня.
* Классы верхнего уровня вынуждены выступать в роли адаптеров и подстраиваться под протокол, определенный на уровне ниже.
*/

// Low level
interface IReportFormatter { void FormatReport(Report report); }
class Reporter {
  IReportFormatter _formatter;
  Reporter(IReportFormatter formatter) { _formatter = formatter; }
  void SendReport() { _formatter.FormatReport(); }
}
// High level
class PdfReporter { void FormatReport(Report report) {} }
class Application { 
  void Run() {
    var reporter = new Reporter(new PdfReporter());
    reporter.SendReport();
  } 
}

/*
* IoC отличает библиотеку от фреймворка. Callback or Observer pattern
* Application (it controls environment) pulls library methods results
* Application push callbacks to framework (it controls environment)
*/

/*
* DI - механизм передачи классу его зависимостей
*/

class Reporter {
  // Constructor injection to resolve dependencies for class
  Reporter(IWriter w) { Logger = LogManager.DefaultLog; }  
  // Method injection to resolve specific dependencies need for method only, if the whole class does not require them
  void CreateReport(IReportFormatter r) {}
  // Property injection to resolve optional dependencies
  ILogger Logger {get;set;}
}

/*
* Качественный дизайн обладает слабой связанностью (low coupling) и сильной связностью (high cohesion). 
* Это значит, что программный компонент имеет небольшое число внешних связей и отвечает за решение близких по смыслу задач.
*/

/* 
** Принцип единственного выбора
* всякий раз, когда система программного обеспечения должна поддерживать множество альтернатив, 
* их полный список должен быть известен только одному модулю системы.
*/
