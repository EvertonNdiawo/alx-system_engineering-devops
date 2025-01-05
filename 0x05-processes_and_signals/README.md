## 0x05. PROCESSES AND SIGNALS in Linux


### Processes

- A process is just a program in execution, a running instance of a program in execution.

	#### Types of processes

	- ___Foreground(Interactive) processes___ - Depend on a user for input.

	- ___Background(Non-interactive / automatic) Processes___ - Run independently of the user.


	#### Process states


	- Running => process is running or ready to run. 

	- Sleeping => in this state when it is waiting for a resource to be available.
		1. Interruptible sleep - will wake to handle signals.
		2. Uninterruptible sleep - Will not wake to handle signals.

	- Stopped => in this state when it receives a `stop` signal.

	- Zombie => process is dead but the entry for the process is still present in the table.


### Commands for process management

- #### top command

	- Used to track the running processes:

		```
			$top
		```
	- Displays a list of processes that are running in real-time along with their memory and CPU usage.

	- Its output includes:

		1. __PID:__ - A unique `process ID` given to each process.
		2. __User:__ - `Username` of the process owner.
		3. __PR:__ - `Priority` given to a process while scheduling.
		4. __NI:__ - `nice` value of a process.
		5. __VIRT:__ - Amount of `virtual memory` used by a process.
		6. __RES:__ - Amount of `physical memory` used by a process.
		7. __SHR:__ - Amount of `memory shared` with other processes.
		8. __S:__ - State of the process:
						- `D` = uninterruptible sleep.
						- `R` = Running.
						- `S` = Sleeping.
						- `T` = Traced / Stopped.
						- `Z` = Zombie.
		
		9. __%CPU:__ - Percentage of `CPU` used by the process.
		10. __%MEM:__ - Percentage of `RAM` used by the process.
		11. __TIME+:__ - Total `CPU time` consumed by the process.
		12. __Command:__ - Command used to activate the process.

	- __*Note*__ 1. Navigation within the list is done using the __up__ and __down__ `arrow keys`.
	-	     2. To quit the process, `q` is used.
	- 	     3. Highlighting a process and then pressing `k` is one of the ways to kill a process.


- #### ps command

	- Short for `Process Status` and displays a currently-running processes. Output generated is however not in real time like that of the `top` command.

		```
			$ps
		```

	- Terminology used is as follows:
		1. __PID__ - Process ID.
		2. __TTY__ - Terminal type.
		3. __TIME__ - Total the process has been running.
		4. __CMD__ - The command that launches the process.


	- __*Note*__ 1. In order to get more information using `ps` command: `ps -u` should suffice. Here such extra information is inclusive of:
		5. __%CPU__ - amount of computing power the process is taking.
		6. __%MEM__ - amount of memory the process is taking up.
		7. __STAT__ - process state.



	- __*Note*__ 2. The command can also be used to list all the processes, 
inclusive of those that are currently not runnng,
even though it is primarily used to show currently running processes: `ps -A`.


- #### Changing priority of a process

	- Prioritizing between processes is possible in linux
	- The priority value for a process is called its `Niceness` value and can range from
`-19` to `19`. 0 is the default value.
	- In `top` command , the fourth column contains the niceness values.

	- To start a process and give it a nice value other than the default one:

		```
			$ nice -n [value] [process name] 
		```

	- To change the value of a process that is already running:

		```
			$ renice [value] -p 'PID'
		```



### More on Process IDs (PID)

- Are process identification numbers and are automatically assigned to every process when they are created in a Unix-like system.

- A process (`init`) is the ancestor of all other processes within the system and is always the first process. It will always have the same id, of `1`.

- The default maximum value of a PID is `32, 767` and is essentially the maximum number of processes that can exist within the system at a go. Large servers may however require many more processes.

- PIDs loop around after the maximum value is reached and therefore a lower PID does not necessarily mean that the process started to run earlier, it could just be an indication of a loop in the values, meaning that it could even be the most recent.

- The file `pid_max` specifies the value at which PIDs wrap around( A value usually 1 greater than the maximum PID). Its default is therefore `37,678` but can be set to any number up to approximately `4,000,000`. This is due to the fact that maximum number of processes within a system is just limited by the amount of RAM available. Therefore having more RAM essentially means you could have more processes running simultaneously.

- Several commands can be used to find the PID's currently on the system. A good number have been discussed up above. e.g `top`, `ps`.

- More commands such as `pstree` - shows process names and PIDs in a tree diagram.

- `pidof` command provides the PID of a program whose name is passed to it as an argument / input.

- Information on current processes is stored in a file, `/proc filesystem` which consists of kernel data that changes in real-time. It is very possible to extract information therein using common commands like `cat` etc.

- Due to the length of the /proc file, it is generally convenient to pipe its content to the `less` command to allow for the output to be read one screenful at a time.

- Also, within this /Proc file, there exists a numbered directory that corresponds with each PID currently on the system and each of the directories contain several standard files containing information about the process. e.g the file `cmdline` contains info about the terminal.

	```
		$ cat /proc/1/cmdline #would display contents about the terminal process.
	```

- There also exists a PID `status` file, which is also found within its directory in /proc. Example:

	```
		$ cat /proc/1/status    # Displays the contents of the status file for PID 1.
	```


