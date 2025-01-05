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

- #### The Top command

	- Used to track the running processes:

		```
			top
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

	- 
