+ **read** : This reads from the stdin
	+ syntax: **read** \[variablename]
+ echo: prints to the Stdout
+ code is read line by line

## Variable
+ There are no data types in Bash. In Bash, a variable is capable of storing numeric values, individual characters, or strings of characters.
### Variable Assignment

 ```bash
  1 #!/bin/bash
  2 echo "Today is " `date`
  3
  4 echo -e "\nenter the path to directory"
  5 read the_path
  6
  7 echo -e "\n you path has the following files and folders: "
  8 ls $the_path
```

### Reading from a file:
	This code reads each line from a file named `input.txt` and prints it to the terminal. We'll study while loops later in this article.

```bash
	while read line
	do
		echo $line
	done < input.txt # redirects the file to the while loop.
```

### command line arguments
In a bash script or function, `$1` denotes the initial argument passed, `$2` denotes the second argument passed, and so forth.
+ Example
```bash
#!/bin/bash
echo "Hello, $1!"
```

### Conditional statements (if/else)
**Syntax**:
```bash
if [[ condition ]]; then
	statement
elif [[ condition ]]; then
	statement 
else
	do this by default
fi
```

+ AND `-a` and OR `-o`
Example
```bash
#!/bin/bash
echo "Please enter a number: "
read num

if [ $num -gt 0 ]; then
  echo "$num is positive"
elif [ $num -lt 0 ]; then
  echo "$num is negative"
else
  echo "$num is zero"
fi
# gt -> '>'
# lt -> '<'
# le -> '<='
#ge -> '>='
```