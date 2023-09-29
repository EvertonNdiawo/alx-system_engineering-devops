In this specific directory,my knowledge of shell permissions is put to the test alongside the normal shell basics I learnt in the other folder. I'll be indicating what each script I create does in this README.md file. 

0-iam_betty -> This is a script to change the user to betty, assuming such a user exists. 

1-who_am_i -> Script that prints the current user name.

2-groups -> a script that prints all the user groups the current user is part of.

3-new_owner -> This script changes the owner of the file hello to the user betty.

4-empty -> Script that creates an empty file called hello

5-execute -> Script to add execute permission to the owner of the a file hello

6-multiple_permissions -> Script to add execute permission to the owner and the group owner and read permission to other users to the file hello.

7-everybody -> Script to add execution permission to the owner, the group owner and the other users, to a file hello.

8-james_bond -> script to give owner no permission at all, group no permission at all and other users all the permissions

9-John_Doe -> Script that sets mode of file hello to -rwx-x-wx 

10-mirror_permissions -> Script file to set mode of a file hello the same as a file Olleh's mode.

11-directories_permissions -> Script to add execute permission to all subdirectories of current directory for the owner, the group owner and all other users.

12-directory_permissions -> A script that creates a directory called my_dir with permissions 751 in the working directory

13-change_owner -> Script to change group owner to school for hello file.

100-change_ower_and_group -> A script that changes owner to vincent and group owner to staff for all files and directories in the working directory.

.
