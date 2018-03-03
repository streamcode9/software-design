* BenchmarkDotNet for benchmarks
* Intel VTune Amplifier for low-level optimizations
* General purpose performance analysis tool for .NET ([link](https://github.com/Microsoft/perfview))
* [ILSpy](https://github.com/icsharpcode/ILSpy)
* WinDbg is powerful debugging and exploring tool for Windows
  * https://msdn.microsoft.com/en-us/library/bb190764(v=vs.110).aspx
  * http://www.stevestechspot.com/default.aspx
  * https://github.com/southpolenator/WinDbgCs
  * https://docs.google.com/document/d/1yMQ8NAQZEBtsfVp7AsFLSA_MkIKlYNuSowG72_nU0ek by https://twitter.com/lowleveldesign 

Development pipeline:
```
A feature -> C# code
C# code + Compiler -> IL assembly
IL assembly + BCL + 3rdParty libs -> Application
Application + CLR -> ASM
ASM + CPU -> Result
```

Variety of implementations:
```
C# Compilers: Legacy, Roslyn
IL Compilation: JIT, NGen, MPGO, .NET Native, LLVM
JITs: Legacy x86 & x64, RyuJIT, Mono
CLRs: CLR2, CLR4, CoreCLR, Mono
GCs: Microsoft GC (few modes), Boehm, Sgen
OSes: Windows, Linux, OS X
Hardware: ...
```
