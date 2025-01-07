#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

/**
 * infinite_while - Runs the parent process indefinitely
 *
 * Return: Always 0
 *
 */

int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}


/**
 * main - Creates 5 zombie processes.
 *
 * Return: 0, success
 *
 */

int main(void)
{
	pid_t PID;
	int i = 0;

	while (i < 5)
	{
		PID = fork();

		if (PID == 0)
		{
			printf("Zombie process created, PID: %d\n", getpid());
			exit(0);
		}
		else if (PID > 0)
		{
			i++;
		}
		else
		{
			return (1);
		}
	}

	infinite_while();

	return (0);
}
