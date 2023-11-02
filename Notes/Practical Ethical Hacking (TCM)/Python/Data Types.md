## Numeric  Datatypes
+ **_int_** : integer data type
+ _**complex :**_  Complex numbers data type
+ **_Float_** : point numbers 
####  Type Conversion or Casting:
This is done by converting a data type to another datatype.
For example:
```python
x = 2.5
int(x)
float(3) # converts 3 to 3.0
str(5.2) # converts 5.2 to a string '5.2'
```


### Random number generation
This example imports the random module and generate a random number from 1 - 10
```python
import random  
  
print(random.randrange(1, 10))
```
## String Datatype
assignment: 
```python
x = 'Hello,' # single string assignment
y = """ we live in a stupid world!
Don't you believe me?""" # miltiple sring assignment
print(x + y)
```

#### Strings are Arrays
+ Strings elements can be accessed by the indexes just like arrays.
```python
string = 'Bonjour'
print(string[3]) 
# looping through a string
for x in sring:
	print(x)
```

### Formatted Strings
#### Methods of Formatting Srings

1. The `format()` method takes the passed arguments, formats them, and places them in the string where the placeholders `{}` are:
	```python
	age = 36  
	txt = "My name is John, and I am {}"  
	print(txt.format(age))
	```

2. Using the `f` short hand method is also an efficient method:
```python
  
age = 36  
print(f"My name is John, and I am {age}")
```

### Sting Methods
+ _**.upper()**_ converts a string to uppercase
+ **_.lower()_** converts a sting to lowercase
+ **_.strip()_**  removes white space from the string
+ **_.replace('x',  'y')_** replaces all the instances of 'x' by 'y' in a string
+ **_.split("a character")_**  this splits a string at the specified character and returns the resulting splits in an array
## List
Lists are used to store multiple items in a single variable(arrays) and are created with square brackets. They are  ordered, changeable, and allow duplicate values.

The `list()` Constructor can also be used to construct a list.
```python
arr = ['list', 'tuple', 'dictionaries'] #with square brackets
arr2 = list(('hello', 'world')) # with the list constructor
```

### Sorting Lists
A List is sorted with the `list.sort()` method which by default sorts a list ascending. however, for descending sort, the `.sort()` takes a boolean argument `reverse` set to true.

#### Reverse Order
The `.reverse()` method is use to reverse the other of a list 
```python
list = [2, 1, 5, 6, 3]
list.sort() # normal sort
list.sort(reverse = True ) # reverse sort
# custom sort
def function(n:int):
	# characteria of sorting
list.sort(key = funtion)

# Reverse order
list.reverse()
```

### Common List Methods 

+ **_list.append(_x_)_**  Add an item to the end of the list. Equivalent to `a[len(a):] = [x]`.

+ **_list.extend(_iterable_)_**  Extend the list by appending all the items from the iterable. Equivalent to `a[len(a):] = iterable`.
 
+ **_list.insert(_i_, _x_)_**  Insert an item at a given position. The first argument is the index of the element before which to insert, so `a.insert(0, x)` inserts at the front of the list, and `a.insert(len(a), x)` is equivalent to `a.append(x)`.
 
+ **_list.remove(`x`)_** Remove the first item from the list whose value is equal to _x_. It raises a [`ValueError`](https://devdocs.io/python~3.11/library/exceptions#ValueError "ValueError") if there is no such item.
 
+ **_list.pop([_i_])_**   Remove the item at the given position in the list, and return it. If no index is specified, `a.pop()` removes and returns the last item in the list. (The square brackets around the _i_ in the method signature denote that the parameter is optional, not that you should type square brackets at that position. You will see this notation frequently in the Python Library Reference.)
 
+ **_list.clear()_**  Remove all items from the list. Equivalent to `del a[:]`.

+ **_list.count(_x_)_**  Return the number of times _x_ appears in the list.
 
+ **_list.sort(_*_, _key=None_, _reverse=False_)_**  Sort the items of the list in place (the arguments can be used for sort customization, see [`sorted()`](https://devdocs.io/python~3.11/library/functions#sorted "sorted") for their explanation).
 
+ **list.reverse()**  Reverse the elements of the list in place.
 
+ **_list.copy()_**  Return a shallow copy of the list. Equivalent to `a[:]`.

## Tuples
These are used to store multiple values in one single variable, but the values store are unchangeable, ordered and allow duplicates.

```python
Atuple = ('apple', 'banana', 'pineapple')
Atuple[1] # 'banana'
Atuple[-1] # 'pineapple'
```

+ Tuples are indexed hence members can be accessed by indexes.
+ Tuples are unchangeable, meaning that you cannot change, add, or remove items once the tuple is created. However, they can be converted to list if needed for manipulation. This can be done by casting.

```python
list1 = list(Atuple)
list1[1] = 'orange' # 'banana' is change to orange
tuple(list1) 
```

### Packing and Unpacking 

```python 
fruits = ("apple", "banana", "cherry")  #Packing
  
(green, yellow, red) = fruits  #Unpacking
  
print(green)  # "apple"
print(yellow) # "banana"
print(red)    # "cherry"
# Tuples can be joined 
tuple1 = ('A', 'B', 'C')
tuple2 = (1, 3, 4, 5)
tuple3 = tuple1 + tuple2 # ('A', 'B', 'C', 1, 3, 4, 5)
```
## Sets
+ Sets are used to store multiple items in a single variable, and it is a collection which is _unordered_, _unchangeable*_, and _unindexed_ with no duplicates.
+ Once a set is created, you cannot change its items, but you can remove items and add new items.

```python
setlist = {'apple', 'mango', 'banana'}
setlist.add('orange') # adds orange
list1 = [1, 3, 4] 
setlist.update(list1) # adds an iterable
# remove and clear
setlist.remove('apple')
setlist.discard('mango')
setlist.pop() # removes a random item from the set
setlist.clear() # clears the sel
del setlist # deletes the set
```

### Joining  Sets
The `union()` method returns a new set with all items from both sets and the `update()` method inserts one set to another:

```python
set1 = {"a", "b" , "c"}  
set2 = {1, 2, 3}  
  
set3 = set1.union(set2)  
print(set3)
#or 
set1.update(set2)
print(set1)

```

NB:
+ The `intersection_update()` method will keep only the items that are present in both sets.
+ The `intersection()` method will return a _new_ set, that only contains the items that are present in both sets.
+ The `symmetric_difference_update()` method will keep only the elements that are NOT present in both sets.
## Dictionary
  
+ Dictionaries are used to store data values in key:value pairs and it is a collection which is ordered*, changeable and do not allow duplicates.
syntax: 
```python
dict1 = {
			'Name': 'Code'
			'age': 10
			'addre': 'bla blaa!'
}
# or
dict2 = (name='code', age = 10, addre = 'bla blaa!')
```

### Accessing Items in a Dict
+ Items can be accessed with using the dict keys as indexes or using the get() method which take the specific key as an argument.

```python
name = dict1['name']
# or
name = dict1.get('name')
keys = dict.keys() # returns dict keys into a list 
values = dict.values() # returns dict values into a list
items = dict.items() # returns each item as a tuple in to a list
```

### Adding and Removing Items
+ Adding an item to the dictionary is done by using a new index key and assigning a value to it.
+ The `update()` method updates the dictionary with the items from a given argument. If the item does not exist, the item will be added.

```python
# Updating a Dict
dict1['Name'] = 'slinky'
dict1.update({'DOB': 2012}) # adds a new item
dict2 = dict1.copy() # making a copy of dict1
```

+ The `pop()` method removes the item with the specified key name.
+ The `popitem()` method removes the last inserted item (in versions before 3.7, a random item is removed instead).

```python
# removing from the dict
dect1.pop('age')
dict1.popitem() # removes the last item
dict1.clear() # clears the entire dict
```