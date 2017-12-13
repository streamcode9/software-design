staic Main () {}

/*

CLR functions: manage memory, load assemblies, security, handling exceptins, synchronization, threads.

Src that supports CLR -> 
check syntax & analyze (compiler) ->
managed module (Portable Executable = PE32, PE32+) = IL + metadata (pros: Data Execution Prevention, Address Space Layout Optimization)

Managed module:
 	PE32/+ header (type of file = CUI, GUI, DLL; assembly date)
 	CLR header (CLR ver, entry point, metadata & resources location, strict name)
  Metadata (current module data types and referenced ones) 
 	IL code

Metadata:
  - allows to avoid header files,
  - helps VS (IntelliSense)
  - CLR uses it for code verification,
  - allows serialize object to send by network
  - helps GC to track object life cycle
  
 Assembly:
  - logical group of managed modules and resources
  - minimal part of reusing, security, version control
 
 Manifest - metadata tables that describe an assembly files, exported types, resource and data files
*/
