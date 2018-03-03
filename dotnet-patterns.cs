// Strategy
// Определяет семейство алгоритмов, инкапсулирует каждый из них и делает их взаимозаменяемыми. 
// Стратегия позволяет изменять алгоритмы независимо от клиентов, которые ими пользуются.
// Т.е. стратегия инкапсулирует определенное поведение с возможностью его подмены.
// Aбстрактная фабрика — это стратегия создания семейства объектов; 
// фабричный метод — стратегия создания одного объекта; 
// строитель — стратегия построения объекта; итератор — стратегия перебора элементов и т. д. 
// Мотивация использования паттерна «Стратегия»: выделение поведения или алгоритма с возможностью его замены во время исполнения.
// Strategy(ILogReader) — определяет интерфейс алгоритма;
// Context(LogProcessor) — является клиентом стратегии;
// ConcreteStrategyA, ConcreteStrategyB (LogFileReader, Windows EventLogReader) — являются конкретными реализациями стратегии
// Паттерны, повторное использование которых возможно на уровне библиотеки: «Синглтон», «Наблюдатель», «Команда»
// LINQ (Language Integrated Query) — это набор методов расширения, прини-мающих стратегии фильтрации, получения проекции и т. д. Коллекции прини-мают стратегии сравнения элементов, а значит, любой класс, который прини-мает IComparer<T> или IEqualityComparer<T>, использует паттерн «Стратегия».
// WCF просто переполнен стратегиями: IErrorHandler — стратегия обработки коммуникационных ошибок; IChannelInitializer — стратегия инициали-зации канала; IDispatchMessageFormatter — стратегия форматирования сообщений; MessageFilter — стратегия фильтрации сообщений и т. д. Обилие стратегий наблюдается также в Windows Forms, WPF, ASP.NET и других фреймворках.

// Template Method
// Определяет основу алгоритма и позволяет подклассам переопределять некоторые шаги алгоритма, не изменяя его структуры в целом.
// Т.е. шаблонный метод — это каркас, в который наследники могут подставить реализации недостающих элементов.
// AbstractClass (LogReader) — определяет невиртуальный метод;
// Method (ReadLogEntry), который вызывает внутри примитивные операции PrimitiveOperation1(), PrimitiveOperation2() и т.д. (ReadEntries и ParseLogEntry);
// ConcreteClass  (LogFileReader) — реализует примитивные шаги алгоритма.

/*
** Dispose pattern
* Dispose method is called by user code, and finalizer calls it during garbage collection.
* At first "simple" objects call finalizers, then objects inherited from CriticalFinalizerObject.
* This order allows "simple" objects to get access to properties of type Thread, ReaderWriterLock or SafeHandle in the finalizers.
* Если мы храним в классе управляемые и неуправляемые ресурсы, то нарушается принцип единственной обязанности.
*/

/*
** Mediator
* Это клей, связывающий несколько независимых классов между собой. 
* Он избавляет классы от необходимости ссылаться друг на друга, позволяя тем самым их независимо изменять и анализировать.
*/

class LogFileSaver {
  void Save() {}
}
class LogFileReader { 
  LogFileSaver _saver;
  void Read() { _saver.Save(); }
}

/*
* Классы сильно связаны. Для понимания LogFileReader нужно понимать его зависимости.
*/

class LogMediator {
  LogFileSaver _saver;
  LogFileReader _reader;
}

/*
* Cлабая связнасть на границе модулей, а не внутри.
* Суть паттернов - борьба со сложностью.
* Слабая связность vs сильная. Золотая середина.
*/

/*
* LogFileReader --> EventAggregator { SomeEvent; } --> LogFileSaver
* LogFileReader публикует событие о чтении/записи лог-файла и не будет знать, кто его обрабатывает. 
* LogSaver слушает это событие и сохраняет записи, не зная, откуда они были прочитаны.
*/

/*
** Iterator
* Представляет доступ ко всем элементам составного объекта, не рас-крывая его внутреннего представления.
* Iterator (IEnumerator<T>)
* Aggregate (IEnumerable<T>)
*/

/*
** Observer
* Наблюдатель уведомляет подписчиков о произошедшем событии или об изменении своего состояния.
* Общения между двумя программными элементами: pull-модель, push-модель (callbacks, frp, observer).
* Implementations: delegate, event, IObserver/IObservable, Rx
*/

/*
** Visitor
* Описывает операцию, выполняемую с каждым объектом из некоторой иерархии классов.
* Visit() метод для каждого типа данных, чтобы использовать matching вместо if-else
* Паттерн усложняет добавление новых типов в иерархию наследования.
*/

interface ILogEntryVisitor { void Visit(ExceptionLogEntry exceptionLogEntry); void Visit(WarningLogEntry warningLogEntry); }
abstract class LogEntry { abstract void Accept(ILogEntryVisitor logEntryVisitor); }
class ExceptionLogEntry : LogEntry { override void Accept(ILogEntryVisitor logEntryVisitor) { logEntryVisitor.Visit(this); } }
class WarningLogEntry   : LogEntry { override void Accept(ILogEntryVisitor logEntryVisitor) { logEntryVisitor.Visit(this); } }

/*
** Command
* Инкапсулирует запрос как объект, позволяя тем самым задавать параметры клиентов для обработки соответствующих запросов, ставить запросы в очередь или протоколировать их, а также поддерживать отмену операций.
* Отвязывает источник действия от места его исполнения.
*/

/*
** State
* Позволяет объекту варьировать свое поведение в зависимости от внутреннего состояния.
* Socket state: Connected, NotConnected
*/

/*
** ChainOfResponsibility
* Позволяет избежать привязки отправителя запроса к его получателю, давая шанс обработать запрос нескольким объектам.
* Связывает объекты-получатели в цепочку и передает запрос вдоль этой цепочки, пока его не обработают.
* Пример: обытие Closing в Windows Forms с возможностью отмены закрытия формы путем установки свойства Cancel аргумента CancelEventArgs в True.
*/

/*
** Singleton
* Гарантирует, что у класса есть только один экземпляр, и предоставляет глобальную точку доступа к нему.
* A.k.a global variable
* Недостатки: невозможность юнит-тестирования, низкая гибкость.
*/

public sealed class LazySingleton {
  private static readonly Lazy<LazySingleton> _instance = new Lazy<LazySingleton>(() => new LazySingleton());
  LazySingleton() {}
  public static LazySingleton Instance { get { return _instance.Value; } }
}

public sealed class DoubleCheckedLock {
  private static volatile DoubleCheckedLock _instance;
  private static readonly object _syncRoot = new object();
  DoubleCheckedLock() {}    
  public static DoubleCheckedLock Instance {
    get {
      if (_instance == null) {
        lock(_syncRoot) {
          if (_instance == null) _instance = new DoubleCheckedLock();          
        }
      }
      return _instance;
    }
  }
}

/*
** Abstract Factory
* Представляет собой стратегию (Strategy pattern) создания семейства взаимосвязанных или родственных объектов.
* AbstractFactory (DbProviderFactory), AbstractProduc (DbCommand, DbConnection), Product, Client
*/

/*
** Factory Method
* Определяет интерфейс для создания объекта, но оставляет подклассам решение о том, какой класс инстанцировать.
*/

struct Timespan {
  public static Timespan FromSeconds(double value) {}
  public static Timespan FromMinutes(double value) {}
}

/*
** Builder
* Отделяет конструирование сложного объекта от его представления, так что в результате одного и того же процесса конструирования могут получаться разные представления.
*/

class MailBuilder {
  Mail _mail = new Mail();  
  MailBuilder SetToAddress(string address) { _mail.To = address; return this; }
  Mail Build() { return _mail; }
}

/* System.Collections.Immutable  */

/*
** Adapter
* Преобразует интерфейс одного класса в интерфейс другого.
*/

class SqlReader   { Read(SqlQuery query); }
class MongoReader { Read(MongoQuery query); }

interface IReaderAdapter { Read(Query query); }

class SqlReaderAdapter   { Read(Query query); }
class MongoReaderAdapter { Read(Query query); }

/*
** Facade
* Повышает уровень абстракции и упрощает решение задач (скрывает низкоуровневые детали)
*/

/*
** Decorator
* Динамически добавляет объекту новые обязанности
* Применение: кэш, логи, управление доступом
*/

interface ISaver { void Save(); }

class DbSaver : ISaver { void Save(); }

abstract class SaverDecorator : ISaver {
  ISaver _decoratee;
  SaverDecorator(ISaver saver) { _decoratee = saver; }
  abstract void Save();
}

classs ThrottlingSaverDecorator : SaverDecorator {
  ThrottlingSaverDecorator(ISaver) : base (decoratee) { }
  void Save() {
    if (!QuatoReached) _decoratee.Save();
  }
}

var saver = new ThrottlingSaverDecorator(new DbSaver());
var controller = new SomeController(saver);

/*
** Composite
* Компонует объекты в древовидные структуры, позволяя единообразно трактовать индивидуальные и составные объекты
*/

/*
** Proxy
* Суррогат другого объекта, контролирующий доступ к нему
*/

class DbSaverProxy : DbSaverBase<ISaver>, ISaver { void Save(); }

/*
https://docs.microsoft.com/en-us/dotnet/framework/debug-trace-profile/code-contracts
http://joeduffyblog.com/2005/04/08/dg-update-dispose-finalization-and-resource-management/
http://sergeyteplyakov.blogspot.com/2011/12/blog-post.html
http://martinfowler.com/articles/mocks-ArentStubs.html
http://sergeyteplyakov.blogspot.com/2010/06/c-1.html
http://sergeyteplyakov.blogspot.com/2011/07/blog-post.html
Lazy data type
volatile keyword
https://msdn.microsoft.com/magazine/jj883956
http://sergeyteplyakov.blogspot.com/2013/01/blog-post.html#AmbientContext
http://www.jot.fm/issues/issue_2007_07/article3/index.html
http://sergeyteplyakov.blogspot.com/2011/11/blog-post_03.html
*/


