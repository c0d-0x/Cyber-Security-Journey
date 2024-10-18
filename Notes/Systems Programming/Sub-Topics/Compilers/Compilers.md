#### What is a Compiler?

A **compiler** is a special program that translates high-level programming code (such as C++, Java, or Python) into machine code or intermediate code that a computer’s processor can understand and execute. The process of compilation involves several phases that systematically convert source code into an executable form.

### Components of a Compiler:

The process of compilation is typically divided into **two parts**:

1. **Front-end**: Deals with syntax and semantics of the code.
2. **Back-end**: Focuses on optimisation and machine code generation.

### Key Phases of Compilation

1. **Lexical Analysis** (Scanner)
    
    - **Input**: Source code (as text).
    - **Task**: Converts the source code into a sequence of tokens. A **token** is a string with an assigned meaning, such as keywords, identifiers, literals, etc.
    - **Output**: Stream of tokens.
    - **Tools**: Regular expressions, lexical analyser like **Lex**.
2. **Syntax Analysis** (Parser)
    
    - **Input**: Stream of tokens from lexical analysis.
    - **Task**: Organises tokens into a syntax tree, according to the grammar rules of the programming language. This phase ensures that the structure of the code follows language rules.
    - **Output**: Parse Tree (also called **Abstract Syntax Tree** - AST).
    - **Tools**: Context-Free Grammars (CFG), parsers like **Yacc**, **ANTLR**.
3. **Semantic Analysis**
    
    - **Input**: Abstract Syntax Tree (AST).
    - **Task**: Ensures that the code follows semantic rules, e.g., type-checking, variable declarations, and scope resolution.
    - **Output**: Annotated AST (with types, memory addresses, etc.).
4. **Intermediate Code Generation**
    
    - **Input**: Annotated AST from semantic analysis.
    - **Task**: Converts the code into an intermediate form (closer to machine code, but still abstract), like **three-address code**, **quadruples**, or **SSA** (Static Single Assignment).
    - **Output**: Intermediate Representation (IR).
5. **Optimisation**
    
    - **Input**: Intermediate representation.
    - **Task**: Optimises the intermediate code for performance (speed, memory usage, etc.). Common optimisations include:
        - Constant folding
        - Dead code elimination
        - Loop optimisation
        - In-lining functions
    - **Output**: Optimised Intermediate Representation.
6. **Code Generation**
    
    - **Input**: Optimised intermediate code.
    - **Task**: Converts the intermediate code into target machine code (assembly or binary instructions specific to a hardware architecture, such as x86, ARM, etc.).
    - **Output**: Machine code.
7. **Code Linking and Loading**
    
    - **Input**: Machine code.
    - **Task**: Combines machine code with libraries and other necessary object code (linking). Loads the code into memory for execution.

### Blueprint of a Compiler

```sql
+------------------------------------------------------+
|                      Compiler                        |
+------------------------------------------------------+
|                                                      |
|  +---------------------+     +---------------------+ |
|  | Front-End (Analysis)|     | Back-End (Synthesis)| |
|  +---------------------+     +---------------------+ |
|                                                      |
|  1. Lexical Analysis --> Token Stream                |
|                                                      |
|  2. Syntax Analysis --> Parse Tree                   |
|                                                      |
|  3. Semantic Analysis --> Annotated AST              |
|                                                      |
|  4. Intermediate Code Generation --> Intermediate    |
|        Representation (IR)                           |
|                                                      |
|  5. Optimization --> Optimized IR                    |
|                                                      |
|  6. Code Generation --> Machine Code                 |
|                                                      |
+------------------------------------------------------+

   +---------------+                 +-----------------+
   |  Source Code  | --1-2-3-4-5-6-> | Executable Code |
   +---------------+                 +-----------------+
```

[Chatgpt](https://chatgpt.com/) Generated 