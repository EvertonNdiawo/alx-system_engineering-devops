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

- `$$` is a special variable that holds the `PID` of the `current shell`.

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


### Signals

- Is an event generated in response to some condition, an interrupt of some sort.
- Upon receipt of a signal, a process takes some action.


	- #### Types of signals

		1. Maskable => Can be changed or ignored by the user.(Ctrl+C)

		2. Non-Maskable => Cannot be changed or ignored by the user.


	- #### Common signals:

		| Signal   | Description                                                                 |
		|----------|-----------------------------------------------------------------------------|
		| SIGHUP   | Hang-up detected on controlling terminal or death of controlling process.   |
		| SIGINT   | Issued if the user sends an interrupt signal (Ctrl + C).                    |
		| SIGQUIT  | Issued if the user sends a quit signal (Ctrl + D).                          |
		| SIGFPE   | Issued if an illegal mathematical operation is attempted.                   |
		| SIGKILL  | Process quits immediately and will not perform any clean-up operations.     |
		| SIGTERM  | Software termination signal (sent kill by default).                         |
		| SIGALRM  | Alarm clock signal (used for timers).                                       |




## Ampersands(&) on the command line

- `&` In bash, on the linux terminal is a `control operator` and can manifest as either a single ampersand or double ampersand. (& and &&).

	- ### Single ampersand (&)

	- Example:
		```
			./myscript.py &
		```

	- Directs the shell to run the command in the `background`, it is forked and run in a seperate sub-shell, as a job, asynchronously. The shell then returns a return status of 0 adn then continue as normal.

	- The shell also prints out the forked process's job number and PID like so:

		```
			./myscript.py &
			[1] 1333
		```

	- After a process is forked using a single trailing ampersand, its PID is stored ina special variable, `&!` which can be used to later refer to the process. The process can now also be seen in the `jobs` list:
	
		```
			$ echo &!
			1333

			$ jobs
			[1]+ Running		./myscript.py &
		```


	- The `foreground`(___fg___) command can bring back this process to the command line before it finishes.

	- This single ampersand can also delimit a list of various commands to run asynchronously:

		```
			$ ./script.py & ./script2.py & ./script3.py &
		```

	- In this, all 3 python scripts are run at the same time, in seperately forked sub-shells. Their output is however still tied to the parent shell that has been forked and therefore since it is run from a linux terminal, the outputs will be on the same terminal.


	- __Note:__ - To detach a process completely from the shell, piping the `stdout` and `stderr` to a file or to `/dev/null` would be a really nice way to do this, especially with the `nohup` command.



	- ### Double ampersand (&&)

	- In bash, a double ampersand means `AND` and can be used to seperate a list of commands to be run sequentially(one after the other).

	- Commands seperated by a && are to be run `synchronously` with each one running only if the last one did not fail( with an intepretation of fail as returning a non-zero return status).


	- Example:
		```
			$ cd /root/ && echo "I've got root"
		```

	- Here, the `cd` command runs first and attempt to change directory to root. If successfull, the `echo` command then executes. If the cd command fails, directory is not changed to root and therefore the echo command is not executed.


	- Example2:

		```
			$ cd /tmp/files/ \                             //Go to this directory
			&& tar zcvf files.tgz * \                     //Tar up the files
			&& rsync -avz files.tgz example.com:/tmp/    //rsync the tarballto a server 
		```


	- To escape ampersands and limit their special functionality, just escape with a backslash:

		```
			$ echo Tom \& Jerry
		```




## The /etc/init.d Directory

- This directory contains a number of `start/stop scripts` for various services on the system. Everything is controlled from this directory.

- It is especially useful when there is need to start or stop a process cleanly and without using the kill or killall commands.

- First things first, inorder to control any of the scripts in the init.d manually, root `sudo` access is required. Each script is run as a command in this format:

	```
		$ /etc/init.d/[COMMAND] [OPTION]
	```
where [COMMAND] is the actual command to run and [OPTION] can be one of the following:

	1. start
	2. stop
	3. reload
	4. restart
	5. force-reload

with the most commonly used ones being `start`, `stop` or `restart`.

- An example when stopping your network or restart it:

	```
		$ /etc/init.d/networking stop
		$ /etc/init.d/networking restart

- Some of the most common init scripts in this directory include: - networking - samba -apache2 -ftpd -sshd dovecot -mysql and many more.
	```



## Zombie process

- When a child process ( and every process is a child process of some parent, with the default being the init process), the process sends an exit status to its parent. The process however remains in the OS table as a `zombie process` indicating it is not scheduled for any further execution. It is not completely removed and its PID is not immediately reassigned until it is determined that its exit status is nolonger needed.

- The exit of a child process prompts the parent process receives a `SIGCHLD` signal to indicate that one of its children has finished executing and this prompts the parent process to call the `wait()` `system call` to examine the exit status of the child and then causes the child to be reaped/removed form the process table.

- To verify existence of zombie process on a system:

	```
		$ ps aux
	```

	- procede to look for any processes with a `Z` in the `STAT` column.

- Sending a `SIGCHLD` to the parent (`"kill -s SIGCHLD <pPID>"`) causes well responding parents to reap their zombie children.

- Also, killing the parent process of the zombie, may also kill the zombie children, by forcing the init process to adopt the killed parent's zombie children and reaps them.

## End of Content.
