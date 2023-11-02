 The Python programming language is named after the BBC show “Monty Python’s Flying Circus” and has nothing to do with reptiles, lol.
 
 Python enables programs to be written compactly and readably. Programs written in Python are typically much shorter than equivalent C, C++, or Java programs, for several reasons:

- the high-level data types allow you to express complex operations in a single statement;
- statement grouping is done by indentation instead of beginning and ending brackets;
- no variable or argument declarations are necessary.

#### Source Code Encoding
By default source codes are encoded in UTF-8. However, to specify a different encoding:

syntax:
```python
# -*- coding: encoding -*-
```

#### Specifying an Interpreter for Linux sys.
```python
#!/bin/python3.11
```

![[Data Types]]

#### `if` Statements

```python
x = int(input(Enter an number:  ))
if x < 0:
	 x = 0
     print('Negative changed to zero')
elif x == 0:
     print('Zero')
elif x == 1:
     print('Single')
else:
     print('More')
```
The keyword ‘`elif`’ is short for ‘else if’, and is useful to avoid excessive indentation. An `if` … `elif` … `elif` … sequence is a substitute for the `switch` or `case` statements found in other languages.




![[Concepts and Interesting Functions]]

![[Object Oriented Programming]]
