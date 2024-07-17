# Error Handling Libraries:

Expand error handling capabilities: C doesn't have built-in exception handling like some other languages, but libraries provide enhanced error handling features.
## `<errono.h>`

### **`errno`:**

- **Global variable:** It's a global integer variable defined in `<errno.h>` that stores the error code of the most recent system call or library function that failed.
- **Error codes:** Each error code represents a specific type of error (e.g., file not found, permission denied, invalid argument).
- **Accessing errno:** Include `<errno.h>` and use `perror()` or `strerror()` to translate the error code into a human-readable message:

```C
#include <stdio.h>
#include <errno.h>

int main() {
    FILE *fp = fopen("nonexistent.txt", "r");
    if (fp == NULL) {
	    // Prints "Error opening file: No such file or directory"
        perror("Error opening file"); 
         
        // Prints the numerical errno value
        printf("errno value: %d\n", errno); 

		// Prints the error message string
        printf("Error message: %s\n", strerror(errno));  
    }
    return 0;
}

```

### `perror()`:

Prints a descriptive error message to stderr.
Combines the user-provided message with the error message corresponding to errno. 
found in `<stdio.h>` library. 

### `strerror()`:

Converts an errno value to a human-readable error message string.
found in `<strings.h>` library. 

### `errx()` and `warnx()`:

`errx()` and `warnx()` are functions from the `<err.h>` header in C that offer a concise and controlled way to handle errors and warnings in your programs.

**Key Similarities:**

- Both functions print a formatted error message to `stderr`.
- They provide an alternative to using `perror()` and custom error messages with `printf()`.
- They simplify your code by avoiding explicit checks for `errno` values.

**Key Differences:**

- **Functionality:**
    
    - `errx(int exitval, const char *fmt, ...)` exits the program with the specified `exitval` after printing the formatted message.
    - `warnx(const char *fmt, ...)` continues program execution after printing the formatted message.
    
- **Flexibility:**
    
    - Both functions allow for formatting the error message using `printf()`-style formatting specifiers.
    - `errx()` is less flexible as it doesn't provide access to `errno` information within the message.
    

**Here's a breakdown of their usage:**

**1. `errx()`:**

- Useful for fatal errors where continuing execution is pointless.
- Example:

```C
#include <err.h>

int main() {
    if (fopen("myfile.txt", "r") == NULL) {
        errx(EXIT_FAILURE, "Error opening file 'myfile.txt'");
    }
    // ... other code ...
    return 0;
}
```

**2. `warnx()`:**

- Used for non-fatal errors where recovery or continued execution is possible.
- Example:

```C
#include <err.h>

int main() {
    if (access("logfile.txt", F_OK) == -1) {
        warnx("Log file 'logfile.txt' not found, logs will be disabled.");
        // ... continue program with alternative logging or handling ...
    }
    // ... other code ...
    return 0;
}
```

**Benefits of using errx() and warnx():**

- **Conciseness:** They simplify error handling compared to custom error messages with `printf()`.
- **Clarity:** They provide informative messages directly in the function call.
- **Control:** They offer direct control over program termination (`errx()`) or continuation (`warnx()`).

**Comparison with `perror()`:**

- `perror()` combines the user-provided message with the system error message obtained from `errno`.
- `errx()` and `warnx()` allow custom error messages without relying on `errno`. This can be useful when the error isn't directly related to a system call.

## NB:  For Complex Error Handling:
### liberr:
GNU C library extension for more advanced error handling.
Provides functions for saving and restoring errno, error chaining, and custom error types.

### GLib:
GNOME library with a comprehensive error handling system.
Offers error reporting, propagation, and handling mechanisms.