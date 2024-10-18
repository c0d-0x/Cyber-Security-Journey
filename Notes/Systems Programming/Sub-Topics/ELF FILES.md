The Executable and Linkable Format, also known as ELF, is the generic file format for executables in Linux systems
+ **ELF files are composed of three major components:**
	+ **ELF Header**
     - **Sections**
     - **Segments**
## **ELF Header**

The ELF header contains a struct Elfxx_Ehdr datatype that defines the specifics of a given ELF file.
![[Pasted image 20240720144009.png]]

## ELF **Sections**

Sections comprise all information needed for linking a target object file in order to build a working executable.
![[Pasted image 20240720144722.png]]

Some common sections are the following:

- .text: code.
- .data: initialised data.
- .rodata: initialised read-only data.
- .bss: uninitialized data.
- .plt: PLT (Procedure Linkage Table) (IAT equivalent).
- .got: GOT entries dedicated to dynamically linked global variables.
- .got.plt: GOT entries dedicated to dynamically linked functions.
- .symtab: global symbol table.
- .dynamic: Holds all needed information for dynamic linking.
- .dynsym: symbol tables dedicated to dynamically linked symbols.
- .strtab: string table of .symtab section.
- .dynstr: string table of .dynsym section.
- .interp: RTLD embedded string.
- .rel.dyn: global variable relocation table.
- .rel.plt: function relocation table.
## ELF **Segments**

Segments, which are commonly known as Program Headers, break down the structure of an [ELF binary](https://intezer.com/blog/malware-analysis/elf-malware-analysis-101-initial-analysis/) into suitable chunks to prepare the executable to be loaded into memory. In contrast with Section Headers, Program Headers are not needed on linktime.
![[Pasted image 20240720145440.png]]

**There are a wide range of segment types. Some of common types are the following**

- PT_NULL: unassigned segment (usually first entry of Program Header Table).
- PT_LOAD: Loadable segment.
- PT_INTERP: Segment holding .interp section.
- PT_TLS: Thread Local Storage segment (Common in statically linked binaries).
- PT_DYNAMIC: Holding .dynamic section.
![[Pasted image 20240720145422.png]]