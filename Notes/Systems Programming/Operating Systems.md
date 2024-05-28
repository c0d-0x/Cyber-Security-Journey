An operating system (OS) is a complex piece of software that acts as the intermediary between a computer's hardware and its applications. Imagine it as a highly skilled translator who speaks both the hardware's language (machine code) and the applications' language (high-level programming languages).

#### A breakdown of the OS's low-level workings:

**1. Kernel:** The brain of the OS, the kernel is always running in the background, managing essential tasks like:

- **Memory management:** Allocates and reclaims memory for different programs to run smoothly.
- **Process scheduling:** Decides which program gets to use the CPU at any given time, ensuring fair and efficient resource utilisation.
- **Device drivers:** Acts as the interpreter between the hardware and the applications, allowing programs to interact with peripherals like printers, disks, and network interfaces.
- **Interrupt handling:** Deals with sudden events like keystrokes, mouse clicks, or network traffic, ensuring the system responds promptly.

**2. System calls:** Applications communicate with the kernel through system calls, which are like requests for specific services. For example, when you click a file, the application makes a system call to the kernel to open it.

**3. Hardware abstraction layer (HAL):** The HAL hides the intricate details of the specific hardware from the kernel, allowing the OS to work on different types of computers without needing major changes.

**4. File system:** Organises and manages data storage on your hard drive or SSD, providing a structured way for applications to access and store files.

**5. Security:** The OS implements various security measures to protect your system from unauthorised access, malware, and other threats.

![[Pasted image 20240131122901.png]]

![[Pasted image 20240112122514.png]]


### Program Runtime

![[Pasted image 20240112124541.png]]

![[Pasted image 20240112124801.png]]

## Four Fundamental Concepts of an OS
###  a. Threads: Execution Context
+ Linear Execution context
+ It's a single unique execution context  with program counter Registers, Execution flags, a stack and a memory space.
- **Lightweight processes:** They share the same memory space and resources as the parent process, making them less resource-intensive than creating separate processes.
- **Concurrent execution:** The operating system can schedule threads to run seemingly simultaneously, improving responsiveness and performance.

![[Pasted image 20240112125721.png]]
![[Pasted image 20240112130722.png]]

![[Pasted image 20240114093005.png]]

### **Pthreads (POSIX Threads):**

- An API (Application Programming Interface) for creating and managing multiple threads within a single process.
- Threads are lightweight processes that share the same memory space and resources, enabling concurrent execution.
- It's a standardised API, ensuring portability across POSIX-compliant operating systems (Linux, Unix, macOS, etc.).

**Key Functions:**
#### pthread_create(): Creates a new thread within the calling process.

**Declaration:**

```C
int pthread_create(pthread_t *thread, const pthread_attr_t *attr,
                     void *(*start_routine) (void *), void *arg);
```

**Parameters:**

- `thread`: A pointer to a `pthread_t` variable where the ID of the newly created thread will be stored.
- `attr`: A pointer to a `pthread_attr_t` structure specifying thread attributes (can be NULL for defaults).
- `start_routine`: The function that the new thread will execute.
- `arg`: A single argument that will be passed to the `start_routine` function.

**Return Value:**

- On success, returns 0.
- On error, returns a non-zero error code.

**Key Points:**

- The new thread starts executing the `start_routine` function with the provided `arg` value.
- The `pthread_t` data type uniquely identifies a thread within a process.
- Thread attributes (`attr`) can be used to control scheduling policy, stack size, etc.

**Example:**

```c
#include <pthread.h>
#include <stdio.h>

void *my_thread_function(void *arg) {
    printf("Hello from new thread!\n");
    return NULL;  // Not required, but good practice
}

int main() {
    pthread_t thread;

    // Create a new thread
    if (pthread_create(&thread, NULL, my_thread_function, NULL) != 0) {
        printf("Error creating thread\n");
        return 1;
    }

    // Wait for the thread to finish (optional)
    pthread_join(thread, NULL);

    printf("Main thread finished\n");
    return 0;
}
```

**Additional Notes:**

- Use `pthread_join()` to wait for a thread to finish.
- Use `pthread_detach()` to mark a thread as detached, meaning it won't be waited for.
- Properly manage thread synchronization to avoid race conditions when accessing shared data.

    
#### **pthread _exit():**
- Terminates the calling thread.
- Allows a thread to exit independently of the main thread or other threads in the process.
- Optionally returns a value that can be retrieved by another thread using `pthread_join()`
**Declaration:**

```c
    void pthread_exit(void *retval);
```

**Parameter:**

- `retval`: A pointer to a value that will be returned to the thread that joins with this thread (optional).

**Behaviour:**

- Calls any registered cleanup handlers (pushed with `pthread_cleanup_push()`).
- Calls destructors for any thread-specific data.
- Marks the thread as terminated.
- Does not release process-wide resources like mutexes or file descriptors.
- If called from the main thread, the process may terminate, depending on the implementation.

**Key Points:**

- Use `pthread_exit()` to end a thread's execution before it reaches the end of its start routine.
- It's often used in conjunction with `pthread_join()` to synchronise thread termination and retrieve return values.

**Example:**

```c
#include <pthread.h>
#include <stdio.h>

void *my_thread_function(void *arg) {
    printf("Thread is working...\n");
    pthread_exit((void *)123);  // Return a value
}

int main() {
    pthread_t thread;
    int *result;

    pthread_create(&thread, NULL, my_thread_function, NULL);
    pthread_join(thread, (void **)&result);  // Get the return value

    printf("Thread returned: %d\n", *result);
    return 0;
}
```

**Additional Notes:**

- Implicitly called when a thread's start routine returns.
- Does not release memory for the thread's stack or other resources; this happens when all threads in the process terminate.
- Use `pthread_join()` to ensure proper resource cleanup and avoid potential memory leaks.
#### pthread_join():

![[Pasted image 20240114105859.png]]

- Waits for the specified thread to terminate.
- Synchronises threads by blocking the calling thread until the target thread finishes.
- Retrieves the return value from the target thread, if any.

**Declaration:**

```c
int pthread_join(pthread_t thread, void **retval);
```

**Parameters:**

- `thread`: The thread ID of the target thread to wait for.
- `retval`: A pointer to a pointer where the return value of the target thread will be stored (optional).

**Return Value:**

- On success, returns 0.
- On error, returns a non-zero error code.

**Key Points:**

- Blocks the calling thread until the target thread terminates.
- Cannot be called for a detached thread (a thread marked as `PTHREAD_CREATE_DETACHED` or detached with `pthread_detach()`).
- If a thread has already terminated, `pthread_join()` returns immediately.
- If multiple threads attempt to join the same thread, the behavior is undefined.

**Additional Notes:**

- Use `pthread_join()` to ensure proper resource cleanup and avoid potential memory leaks.
- If a thread is not joined, its resources might not be released until the entire process terminates.
- Joining a thread guarantees that its return value is retrieved.
- Consider using `pthread_detach()` for threads that don't require synchronisation or return values.
    
![[Pasted image 20240114112530.png]]

![[Pasted image 20240114112700.png]]

#### **Mutexes (Mutual Exclusion Locks):**

- Mechanisms to ensure that only one thread can access a shared resource or critical section of code at a time.
- Prevent race conditions and data corruption in multithreaded programs.

**Common pthread_mutex Functions:**

2. **Initialization:**
    
```c
pthreat_mutex_t mutex;
int pthread_mutex_init(pthread_mutex_t *mutex, const pthread_mutexattr_t  *attr);
```

- Initialises a mutex variable before use.
- `mutex`: Pointer to the mutex variable to be initialised.
- `attr`: Optional attributes to control mutex behaviour (can be NULL for defaults).
    
4. **Locking:**
    
    ```c
    int pthread_mutex_lock(pthread_mutex_t *mutex);
    ```
    
    - Acquires the lock for a mutex.
    - If the mutex is already locked, blocks the calling thread until it becomes available.
    - Ensures exclusive access to the shared resource or code section protected by the mutex.
    
6. **Unlocking:**
    
    ```c
    int pthread_mutex_unlock(pthread_mutex_t *mutex);
    ```
    
    - Releases the lock on a mutex, allowing other threads to acquire it.
    - Must be called only by the thread that currently owns the lock.
    
8. **Destruction:**
    
    ```c
    int pthread_mutex_destroy(pthread_mutex_t *mutex);
    ```
    
    - Destroys a mutex when it's no longer needed, freeing associated resources.
    - The mutex must be unlocked before destruction.
    

**Key Points:**

- Use mutexes to protect shared data and critical sections of code from concurrent access.
- Always lock a mutex before accessing a shared resource and unlock it afterwards.
- Avoid deadlocks by acquiring locks in a consistent order across multiple threads.
- Consider using error checking for mutex operations to handle potential issues.
- Choose appropriate mutex attributes based on usage patterns (e.g., recursive mutexes for re-entrant calls).
#### Pthread Condition Variables and functions
**Purpose:**

- Condition variables provide a way for threads to synchronise based on specific conditions rather than just mutual exclusion.
- They allow threads to wait for certain events or states to occur before proceeding with their execution.

**Common Functions:**

2. **Initialisation:**

    ```C
    int pthread_cond_init(pthread_cond_t *cond, const pthread_condattr_t *attr);
    ```
    
    - Initialises a condition variable before use.
    - `cond`: Pointer to the condition variable to be initialised.
    - `attr`: Optional attributes to control the behaviour (can be NULL for defaults).
    
4. **Waiting:**
    
    
    
    ```C
    int pthread_cond_wait(pthread_cond_t *cond, pthread_mutex_t *mutex);
    ```
    
    - Atomically unlocks the specified mutex and blocks the calling thread on the condition variable.
    - The thread will remain blocked until another thread signals the condition variable.
    - Upon being signaled, the thread reacquires the mutex before returning.
    
6. **Signaling:**
  
    ```C
    int pthread_cond_signal(pthread_cond_t *cond);
    ```
    
    - Wakes up at least one thread waiting on the condition variable.
    - If multiple threads are waiting, the choice of which thread to wake is generally arbitrary.
    
8. **Broadcasting:**
    
    ```c
    int pthread_cond_broadcast(pthread_cond_t *cond);
    ```

	- Wakes up all threads waiting on the condition variable.
    
10. **Destruction:**

    ```c
    int pthread_cond_destroy(pthread_cond_t *cond);
    ```

    - Destroys a condition variable when it's no longer needed, freeing associated resources.
    

**Key Points:**

- Condition variables are always used in conjunction with mutexes to ensure proper synchronisation.
- The mutex protects the shared data or condition being checked, while the condition variable handles thread signaling and waiting.
- Avoid spurious wakeups (threads waking up without being signaled) by rechecking the condition within a loop after `pthread_cond_wait()`.
- Use `pthread_cond_broadcast()` when multiple threads need to be notified of a change.
- Remember to initialise and destroy condition variables correctly to avoid resource leaks.
#### Remember:

- Include the `pthread.h` header file for using pthreads functions.
- Link your program with the pthreads library during compilation (e.g., `-lpthread`).
- Pthreads programming requires careful attention to synchronisation and coordination to avoid race conditions and deadlocks

### b. Address Spaces
+ A set of memory addresses accessible to a program with  read or write permissions
![[Pasted image 20240112132354.png]]
#### Memory Protection

+  Memory protection is a mechanism that controls how processes (running programs) can access memory in a computer.
- It prevents processes from:
    - Accessing memory that doesn't belong to them, potentially corrupting other programs or the OS itself.
    - Executing code in data segments, preventing malicious activity.
    - Modifying critical system memory, preventing crashes or unauthorised system modifications.
    
##### Some Basic forms of memory protection
+ B&B ii base on hardware feature; using hardware to set the base and the bound of a memory space.
	![[Pasted image 20240112133746.png]]

+ Hardware Relocation
	![[Pasted image 20240112134338.png]]

	![[Pasted image 20240112151155.png]]

	![[Pasted image 20240114083025.png]]

### c. Processes 
#### What is a Process?
+ A protected address space with one or more threads.
+ A process is a restrictive execution environment with execution rights
- It's essentially an instance of a running program, containing:
    - Code (instructions)
    - Data (variables, memory)
    - Resources (open files, network connections)
    - Execution context (registers, program counter)

**Key Characteristics of Processes:**

- **Isolation:** Each process has its own private memory space, preventing unintended interactions with other processes.
- **Concurrency:** Multiple processes can run concurrently on a single CPU or multiple CPUs, sharing resources and time slices.
- **Independent execution:** Processes can start, execute, and terminate independently of each other.

**Process States:**

1. **New:** The process is being created.
2. **Ready:** The process is waiting to be assigned to a CPU for execution.
3. **Running:** The process is currently executing on a CPU.
4. **Waiting (Blocked):** The process is waiting for an event to occur (e.g., I/O completion, resource availability).
5. **Terminated:** The process has finished execution.

**Process Management:**

- **Creation:** The operating system creates new processes using a process creation system call (e.g., `fork()` in Unix-like systems).
- **Scheduling:** The operating system decides which ready process to run next, using scheduling algorithms (e.g., round-robin, priority-based).
- **Context switching:** The operating system switches between processes, saving the state of the current process and restoring the state of the next process.
- **Synchronisation:** Processes may need to coordinate their actions using mechanisms like semaphores, mutexes, and condition variables to prevent race conditions and ensure data consistency.
- **Communication:** Processes can communicate with each other through various methods, such as shared memory, message passing, or pipes.
- **Termination:** A process can terminate voluntarily or due to an error. The operating system releases its resources and cleans up.

**Importance of Processes:**

- **Multitasking:** Processes enable multiple programs to run simultaneously, improving system responsiveness and resource utilisation.
- **Modularity:** Processes provide a way to structure programs into independent units, promoting code maintainability and re-usability.
- **Protection:** Process isolation safeguards system integrity and prevents errors in one process from affecting others.

**Common Process Management Scenarios in C:**

2. **Creating Child Processes:**

    ```c
    #include <stdio.h>
    #include <unistd.h>
    #include <sys/wait.h>
    
    int main() {
        pid_t pid = fork();
    
        if (pid < 0) {
            // Error creating child process
            fprintf(stderr, "fork failed\n");
            return 1;
        } else if (pid == 0) {
            // Child process
            printf("Hello from child process!\n");
            execve("/bin/ls", NULL, NULL);  // Replace child with "ls" command
        } else {
            // Parent process
            printf("Hello from parent process!\n");
            wait(NULL);  // Wait for child to terminate
        }
    
        return 0;
    }
    ```
    
I'd be glad to explain the `exec` family of functions in C in depth:

2. a. **What are the `exec` functions?**

	The `exec` functions in C are a group of system calls (functions provided by the operating system) used to execute (or launch) a new program from within an existing running program. They essentially replace the current process with a new process that begins running the specified executable file.
	
	**Key Points:**
	
	- **Process Replacement:** When an `exec` function is called successfully, the calling process is effectively terminated, and its memory space is overwritten with the new program. Any code or data in the calling process is lost.
	- **New Process Creation:** The `exec` functions don't directly create a new process. They typically work in conjunction with the `fork()` system call, which creates a copy of the calling process (a child process). Then, the `exec` function is called in the child process to replace it with the new program.
	- **Arguments and Environment:** The `exec` functions allow you to specify the arguments (command-line options) to be passed to the new program and, in some variations, the environment variables it should inherit.
	
	**Variations of the `exec` Family:**
	
	There are several `exec` functions, each with slightly different parameter lists:
	
	- **`execl(path, arg1, ..., argN, (NULL))`**
	    - Takes the path to the executable as the first argument.
	    - Subsequent arguments are pointers to null-terminated strings representing the program's arguments.
	    - The last argument must be a NULL pointer to terminate the argument list.
	
	- **`execlp(file, arg1, ..., argN, (NULL))`**
	    - Similar to `execl`, but it searches for the executable file `file` in the standard search path (e.g., `/bin`, `/usr/bin`). This can be convenient if you don't know the exact location of the executable.
	
	- **`execle(path, arg1, ..., argN, (NULL), envp[])`**
	    - Extends `execl` by allowing you to specify an environment for the new process using the `envp` array, which is an array of null-terminated strings representing environment variables (e.g., `PATH=~/bin:/usr/local/bin`).
	
	- **`execv(path, argv[])`**
	    - Instead of separate arguments, takes an array of pointers to null-terminated strings (`argv[]`) that contains both the program name and its arguments. The last element of `argv` must be NULL.
	
	- **`execvp(file, argv[])`**
	    - Similar to `execv`, but searches the standard search path for the executable `file`.
	
	**Common Use Case: Launching Child Processes**
	
	A typical scenario for using the `exec` functions is to create a child process using `fork()` and then replace it with a new program using `exec` in the child process. This allows the parent process to continue execution while the child process runs the new program. Here's an example:
	
	```c
	#include <stdio.h>
	#include <unistd.h>
	
	int main() {
	    pid_t pid = fork();
	
	    if (pid == 0) {
	        // Child process
	        char *argv[] = {"ls", "-l", "/", NULL};
	        execv("/bin/ls", argv);  // Replace child with "ls" command
	        perror("execv");  // Only if execv fails
	        _exit(1);  // If execv fails, terminate child abnormally
	    } else if (pid > 0) {
	        // Parent process
	        printf("Parent waiting for child...\n");
	        wait(NULL);  // Wait for child to finish
	        printf("Child process finished.\n");
	    } else {
	        perror("fork");
	        return 1;
	    }
	
	    return 0;
	}
	```
	
	In this example, the parent process forks a child process. The child process then calls `execv` to replace itself with the `ls` command, which lists directory contents. The parent process waits for the child to finish using `wait`.
	
	**Important Considerations:**
	
	- **Error Handling:** It's crucial to check the return value of `exec` functions (usually using `perror`) to handle any errors that might occur during the replacement process.
	- **Resource Management:** Since the calling process is terminated, any resources it holds (open files, memory allocations) are released. Ensure proper resource management before calling `exec`.
	- **Security:** Be cautious when using `exec` functions, especially when dealing with untrusted input or code. Malicious programs could potentially leverage `exec` to launch harmful binaries.

2. b. **Communicating Between Processes:**
    
    - **Pipes:** Used for unidirectional communication between processes.
    - FIFOs: Uing named piped.
    - **Shared memory:** Allows processes to share a common memory region for data exchange.
    - **Message queues:** Facilitate message-based communication between processes.
  

**Remember:**

- Process management functions are system calls, interacting with the operating system kernel.
- Explore header files like `<unistd.h>`, `<sys/wait.h>`, and `<signal.h>` for more process-related functions.
- Consider using libraries like pthreads for multi-threading within a process.

![[Pasted image 20240112152110.png]]
### Dual Mode Operations
+ User Mode
+ Kernel Mode
#### Example: Unix, monolithic Kernel based 

![[Pasted image 20240112152432.png]]

![[Pasted image 20240112152758.png]]

![[Pasted image 20240112153302.png]]

![[Pasted image 20240114093952.png]]