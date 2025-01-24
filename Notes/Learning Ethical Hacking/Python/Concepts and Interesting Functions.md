- The keyword argument **_end_** can be used to avoid the newline after the output, or end the output with a different string:
 ```python
a, b = 0, 1
while a < 100:
	print(a, end=',')
	a, b = b, a+b
```

- **_pass_** is a null operation — when it is executed, nothing happens. It is useful as a placeholder when a statement is required syntactically, but no code needs to be executed, for example:

```python
def f(arg): pass    # a function that does nothing (yet)

class C: pass       # a class with no methods (yet)
```

+ **_len()_** :  to get the length of an iterable 
```python
hi = 'hello world'
print(len(hi)) # prints the length of the sting
```

+ **_Lambda  Functions _**:  This is a small anonymous function that can take any number of arguments, but can only have one expression.

```python
sum2 = lambda a, b : a + b  # returns a + b
sum3 = lambda a, b, c : a + b + c # returns a + b + c
```
NB: The power of lambda is better shown when you use them as an anonymous function inside another function.