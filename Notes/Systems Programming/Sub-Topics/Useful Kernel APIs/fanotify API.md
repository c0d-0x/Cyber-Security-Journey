  The fanotify API provides notification and interception of filesystem events. It has ability to monitor all of the objects in a mounted  filesystem, the ability to make access permission decisions, and the possibility to read or modify files before access by other applications. It offers a granular level of control over file system activity, making it ideal for tasks like:

- **Virus scanning**
- **Hierarchical storage management**
- **Access control**
- **File integrity checking**
### Key Concepts

- **Fanotify group:** A kernel-internal object that maintains a list of monitored files, directories, filesystems, and mounts.
- **Mark mask:** Specifies the events to be monitored for a specific file or directory.
- **Ignore mask:** Specifies events to be ignored.
- **Event notification:** When a monitored event occurs, a notification is sent to the application.

### Core System Calls

- **fanotify_init(2):** Creates and initialises a fanotify group, returning a file descriptor.
``` c
int fanotify_init(unsigned int flags, unsigned int event_f_flags);
```

---
	 - **flags:** A bitmask specifying the behavior of the fanotify group. Common flags include:
		 - **FAN_CLOEXEC:** Close the file descriptor on execve().
		 - **FAN_CLASS_CONTENT:** Receive events about file contents (e.g., open, close, read, write).
		 - **FAN_CLASS_PRE_CONTENT:** Receive events about potential file access (e.g., permission checks).
		 - **FAN_NONBLOCK:** Make the file descriptor non-blocking.
	 - **event_f_flags:** Specifies the file status flags for the open file descriptions created for fanotify events.

- **fanotify_mark(2):** Adds a file or directory to the fanotify group with specific mark and ignore masks.
- **read(2):** Reads event notifications from the fanotify file descriptor.
- **write(2):** Sends responses to the kernel (e.g., allowing or denying access).
- **close(2):** Closes the fanotify file descriptor.