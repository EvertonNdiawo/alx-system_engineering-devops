## 0x02.Shell, I/O Redirections and filters

### I/O Redirections

- Redirections provide for a way to redirect the `output` of shell commands to `files`, `devices` and even to the `input` of other commands. This is different from the default behaviour of most commands mostly printing their output to the display.

#### Standard output

- Standard output is a facility that most commands make use of, and it directs its contents to the display(screen).

- In order to redirect standard output to a file, the `>` character is used: 

```
	ls > file_list.txt
```

In this case, the `ls` command is executed and its results are written in a file named file_list.txt. And therefore no results appear on screen since the output is redirected elsewhere(to the file).

Also, each time this command is repeated, the file `file_list.txt` gets overwritten from the beginning with the output of the command `ls`.

- To have new results `appended` to the file instead, `>>` is used:

```
	ls >> file_list.txt
```

In this case, the results are added to the end of the file, thus making the file longer each time the command is executed.

- If the file does not exist during redirection, it is created and then the content appended from the beginning.


#### Standard input

- Many commands can accept input from this facility, `standard input`.

- By default the standard input gets its contents from the `keyboard`, but just like standard output, it can be redirected.

- To redirect standard input from a file instead of a keyboard, the `<` is used:

```
	sort < file_list.txt
```

Here, the `sort` command is used to process the contents of file `file_list.txt`. The results are then output on the standard output since output was not redirected. Its possible to also redirect the output:

```
	sort < file_list.txt > sorted_file_list.txt
```


#### Pipelines

- **I/O redirections** can be **used to connect multiple commands together** to form a `pipeline`.

- With pipelines, the standard output of a command is fed into the standard input of another command:

```
	ls -l | less
```

Here, the output of the `ls` command is fed into `less` command using `|`.

- some examples to try out:

```
	ls -lt | head  /* Displays 10 newest files in current directory*/

	du | sort -nr /* Displays list of directories and how much space they
			consume, sorted from largest to the smallest*/

	find . -type f -print | wc -l   /* Displays total number of files in 
					   current working directory and all
					   its subdirectories*/
```


### Filters

- Commonly used with pipelines.

- Takes a standard input, perform an operation on it and then send the results to the standard output.

- Some of the common programs that can act like `filters` include:

	1. sort => Sorts standard input then outputs the sorted result on standard output.

	2. uniq => Removes duplicate lines of data from a sorted stream of data from the standard input.

	3. grep => Examines each line of data it receives from standard input and outputs every line that contains a specified pattern of characters.

	4. fmt => Reads text from standard input then outputs formatted text on standard output.

	5. pr => Takes text from standard input, `splits` the `data` into `pages` with `page breaks`, `headers` and `footers` in preparation for `printing`.

	6. head => Outputs the first few lines of its input. Named so for getting the headers of files.

	7. tail => Outputs the last few lines of its input. Useful for getting the most recent entries from a log file.

	8. tr => Translates characters. Can be used to perform tasks such as `upper/lowercase conversions` or changing line termination characters from one type to another (e.g converting DOS text files into Unix style text files).

	9. sed => Stream editor. Can perform more sophisticated text translations than `tr`.

	10. awk => An entire programming language designed for constructing filters. 




### Special characters

- also known as `meta-characters`
- Are evaluated by `Bash` to have a ___non-literal___ meaning.
- They thus carry out special instructions.
- Usually their meaning is interpreted and then they are removed from the command before executing it.

- Examples of more common special characters:

| Char. | Description |
|-------|-------------|
| " "   | Whitespace — this is a tab, newline, vertical tab, form feed, carriage return, or space. Bash uses whitespace to determine where words begin and end. The first word is the command name and additional words become arguments to that command. |
| $     | Expansion — introduces various types of expansion: parameter expansion (e.g. $var or ${var}), command substitution (e.g. $(command)), or arithmetic expansion (e.g. $((expression))). More on expansions later. |
| ''    | Single quotes — protect the text inside them so that it has a literal meaning. With them, generally any kind of interpretation by Bash is ignored: special characters are passed over and multiple words are prevented from being split. |
| ""    | Double quotes — protect the text inside them from being split into multiple words or arguments, yet allow substitutions to occur; the meaning of most other special characters is usually prevented. |
| \     | Escape — (backslash) prevents the next character from being interpreted as a special character. This works outside of quoting, inside double quotes, and generally ignored in single quotes. |
| #     | Comment — the # character begins a commentary that extends to the end of the line. Comments are notes of explanation and are not processed by the shell. |
| =     | Assignment — assign a value to a variable (e.g. logdir=/var/log/myprog). Whitespace is not allowed on either side of the = character. |
| [[ ]] | Test — an evaluation of a conditional expression to determine whether it is "true" or "false". Tests are used in Bash to compare strings, check the existence of a file, etc. More of this will be covered later. |
| !     | Negate — used to negate or reverse a test or exit status. For example: ! grep text file; exit $?. |
| >, >>, < | Redirection — redirect a command's output or input to a file. Redirections will be covered later. |
| |     | Pipe — send the output from one command to the input of another command. This is a method of chaining commands together. Example: echo "Hello beautiful." | grep -o beautiful. |
| ;     | Command separator — used to separate multiple commands that are on the same line. |
| { }   | Inline group — commands inside the curly braces are treated as if they were one command. It is convenient to use these when Bash syntax requires only one command and a function doesn't feel warranted. |
| ( )   | Subshell group — similar to the above but where commands within are executed in a subshell (a new process). Used much like a sandbox, if a command causes side effects (like changing variables), it will have no effect on the current shell. |
| (( )) | Arithmetic expression — with an arithmetic expression, characters such as +, -, *, and / are mathematical operators used for calculations. They can be used for variable assignments like (( a = 1 + 4 )) as well as tests like if (( a < b )). More on this later. |
| $(( )) | Arithmetic expansion — Comparable to the above, but the expression is replaced with the result of its arithmetic evaluation. Example: echo "The average is $(( (a+b)/2 ))". |
| *, ?  | Globs — "wildcard" characters which match parts of filenames (e.g. ls *.txt). |
| ~     | Home directory — the tilde is a representation of a home directory. When alone or followed by a /, it means the current user's home directory; otherwise, a username must be specified (e.g. ls ~/Documents; cp ~john/.bashrc .). |
| &     | Background — when used at the end of a command, run the command in the background (do not wait for it to complete). |

