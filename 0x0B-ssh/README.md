## 0X0B. SSH

- ### Server computing

	- A server is a computer that provides information to other computers, clients on a network.

	- Such an architecture forms what is generally termed as a client-server model.

	- Typical servers include ___database servers___, ___file servers___, ___mail servers___, ___web servers___, ___print servers___ and ___application servers___.

	- In a client-server model, a client sends a request to the server and the server responds back with a response to the client. 

	- Table below outlines different servers:


		| Server type 		| Purpose 			| clients 		|
		|-----------------------|-------------------------------|-----------------------|
		| **Application server** | - Host's application `back ends` that user clients (__front ends__, __web apps__, or __locally installed applications__) in the network connect to and use. \n- Not necessarily connected to the internet, even a local network can do | Clients with a browser or a local front end, or a web server. |
		| Catalog server | Maintains an index or table of contents that can be found across a large distributed network, such as computers, users, files shared on file servers and web apps. | Any computer program that needs to find something on the network e.g email client looking for an email address |
		| Communications server | Maintains an environment needed for one communication endpoint to find other endpoints and communicate with them. | Communication endpoints |
		| **Computing server** | Shares vast amounts of computing resources, especially CPU and RAM over a network. | Any computer that needs more CPU power and RAM than a personal computer. Works especially great amongst networked computers. |
		| **Database server** | Maintains and shares any form of a database over a network. | spreadsheets, accounting software, asset management software or any program that consumes organized data, especially in large volumes. |
		| Fax server | shares one or more fax machines over a network, thus eliminating the hassle of physical access | Any fax sender or recipient |
		| **File server** | Shares files and folders, storage space to hold files and folders, or both over a network | Networked computers |
		| Game server | Enables several computers or gaming devices to play multiplayer video games | Personal computers and gaming consoles |
		| **Mail server** | Makes email communication possible | Senders and recipients of mail |
		| Media server | Shares digital video or digital audio over a network through media streaming. | User-attended personal computers. |
		| **Print server** | Shares one or more printers over a network, eliminating the hassle of physical access. | Computers in need of printing something. |
		| Sound server | Enables computer programs to play and record sound | Computer programs of the same computer and network clients. |
		| **Proxy server** | Acts as an intermediary between a client and a server, accepting incoming traffic from the client and sending it to the server. May be done to control traffic and filter, prevent unauthorized network access or just routing the traffic over a large and complex network. | Any networked computer |
		| **Virtual server** | shares hardware and software resources with other virtual servers. | Any networked computer |
		| **Web server** | Host web pages. A single one could also host multiple websites. | Computers with a web browser |


	- Servers generally have no Graphical user interface and are configured and managed remotelyvia various methods: 
			- Microsoft management console(MMC)
			- Powershell
			- SSH
			- Browser based out-of-band management systems.

	- Servers generally make so much use of hardware redundancy, such as dual power supplies, RAID disk systems, ECC memory, allowing hot swapping of critical server components  etc.


### SSH Essentials

- Stands for `Secure Shell` and is a secure protocol used to connect remotely to linux servers

- Provides a text-based interface by spawning a remote shell. After connecting, all commands typed in the terminal are executed in the remote server.

- Connecting through SSH means loging in using an account that exists on the remote server.



	- #### How SSH works

		- When connecting through SSH, a shell session is dropped, a text-based interface wher interacting with the server is possible. Any commands typed into this terminal are sent through an encrypted SSH tunnel and executed on the server.

		- The remote server runs a software, SSH daemon that listens to connections on a specific network port, authenticates connection requests and spawns the appropriate environment if the user provides the correct credentials.

		- The user's machine must have an SSH client, a piece of software that knows how to communicate using the SSH protocol, can be given information about the remote host to connect to, the username to use, and the credentials that should be passed to authenticate.

	- #### How SSH authenticates users

		- Clients can generally authenticate using `passwords`( less secure) or `SSH keys`(very secure)

		- `SSH keys` are a matching set of cryptographic keys which can be used for authentication. Each set contains a public and a private key. The public key is shared freely without concern, while the private key is closely guarded and never exposed to anyone.

		- To authenticate using SSH keys, a user must have an SSH key pair on their local computer. On the remote server, the public key must be copied to a file within the user's home directory at `~/.ssh/authorized_keys`, a file which contains a list of public keys, that are authorized to log into this account.

		- When a client connects to the host, and wishing to use SSH key authentication, it informs the server of this intent and tells the server which public key to use. Server then checks its `authorize_keys` file for the public key, generates a random string, encrypts it using the public key, then sends this message back to the client for decryption as its only the associated private key can decrypt it.

		- Upon receipt of this encrypted message, the client decrypts it using the private key and combines the random string that is revealed with a previously negotiated session ID. It then generates an MD5 hash of this value and transmits it back to the server. The server comparest the original message and session ID and determines whether the client truly has the private key.



	- #### Generating an SSH key pair

		- A number of cryptographic algorithms can be used to generate SSH keys, including RSA, DSA, and ECDSA. RSA keys are generally preffered and are the default key type. TO generate an RSA key pair on a local computer:

			```
				ssh-keygen

				# This is followed by a series of prompts as below:

				Enter file in which to save the key (/home/demo/.ssh/id_rsa):
				Enter passphrase(Empty for no passphrase):
				Enter same passphrase again:
			```

			- The first prompt allows for choosing of the location to store the RSA privae key. if no option is supplied, the placeholder location is used as a default. The default location generally allows SSH client to find the keys automatically.

			- The next prompts allowf for entering of an arbitrary length passphrase to secure the private key to be generated. This would require keying in this passphrase any time the private key is used.

			- The two files generated after the operation are:
				
				1.  `~/.ssh/id_rsa`: The private key, not to be shared with anyone.
				2. `~/.ssh/id_rsa.pub`: The associated public key. Can be shared freely without consequence.


	- #### SSH key pair with a larger number of bits

		- By default SSH keys are `2048` bits, generally considered good enough for security, but specifying a greater number of bits for a more hardened key is allowed. This is done by using the `-b` argument followed by the number of bits a user would like. Most servers support keys with a lenght of at least `4096` bits. Longer keys may not be accepted for DDOS protection purposes.

			```
				ssh-keygen -b 4096
			```


	- #### Removing or changing the passphrase on a private key

		- If a passphrase had been generated for a private key and it is to be changed or removed, this can be done as below:


			```
				ssh-keygen -p


				Followed by several prompts:

				Enter file in which the key is (/root/.ssh/id_rsa): // Type the location or enter to accept default location
				Enter Old passphrase:
				Enter new passphrase(empty for no passphrase):  //change the passphrase or press `Enter` to remove the passphrase.
				Enter same passphrase again: 


	- #### Displaying the  SSH key Fingerprint

		- Each key pair shares a single cryptographic "fingerprint" which can be used to uniquely identify the keys and can be useful in several situations. To find out the fingerprint of an SSH key:
			```
				ssh-keygen -l

				# Followed by a prompt for the location of the key.
				# Output is of the form: [length of the key] [fingerprint] [acount and host it was created for] [the algorithm used]

				# sample output:

				  4096 8e:c4:82:47:87:c2:26:4b:68:ff:96:1a:39:62:9e:4e  demo@test (RSA)

			```

	- #### Copying the public SSH key to a server with ___SSH-COPY-ID___

		- Copying a public key to a server to allow authentication without a password takes this approach:

			```
				ssh-copy-id [username@remotehost]
			```

			This prompts for the user account's password on the remote system, after which the contents of `~/.ssh/id_rsa.pub` key is appended to the end of the user account's `~/.ssh/authorized_keys` file.


	- ####  Copying a public SSH key to a server without __SSH-Copy-ID__

		- If the `ssh-copy-id`	utility is not available, the contents of the key can be output and piped into the `ssh` command. On the remote side, after ensuring the `~/.ssh` directory exists, appending the contents into the `~/.ssh/authorized_keys` file is then done.

			```
				cat ~/.ssh/id_rsa.pub | ssh username@remote_host "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"



	- #### Copying a public SSH key to a server manually

		- On the local machine, find contents of the public key file

		- Copy the value and manually paste it into the appropriate location on the remote server, authorized_keys file in the .ssh directory that is.




### Basic connections to the server


	- #### Connecting to a remote server

		- Co connect to a remote server and open a shell session there, the `ssh` command comes in handy:
			```
				ssh remote_host


				ssh username@remote_host
			```


	- #### Running a single command on the server

		- To run a single command on the remote server without spawning a shell session, add the command after the connection information:

			```
				ssh username@remote_host [COMMAND TO RUN]
			```

	- #### Logging into the server with a different port

		- By default the SSH daemon on a server runs on port `22`. Any ssh client would assume that this is the case when trying to connect. If the ssh server is listening on a non-standard port, specifying the new port number when connecting with the client becomes imperative. The port number is specified using the `-p` option:

			```
				ssh -p [PORT NUMBER] username@remote_host
			```

			- To automate this and avoid having to specify the port number everytime for a server whose SSH port is configured into a different port from the default one, creating or editing a configuration file in the `~/.ssh` directory within the home directory of the client and setting host-specific configuration options would make things so easy:

			```
				#cat ~/.ssh/config

				Host [remote_alias]
			             Hostname [REMOTE_HOST]
				     Port [PORT NUMBER]
			```


	- #### Adding SSH keys to an SSH agent to avoid typing the passphrase

		- If an SSH private key has a passphrase, the remote host prompts to enter the passphrase every time the private key is used. To avoid repeatedly doing this, an ssh agent comes through. It is a small utility and it stores the private key after entering the passphrase for the first time. The key is available for the duration of the terminal session, allowing to connect in the future without re-entering the passphrase.

		- To start the SSH agent:

			```
				eval $(ssh-agent)

				output:
				Agent pid 10891
			```

			This starts the agent program and places it into the background. Next is adding the private key to the agent, so that it manages the key:

			```
				ssh-add
			```


	- #### Forwarding SSH credentials to use on a server

		- If a client wishes to connect without a password to one server from within another server, forwarding ssh key information solves this. It allows authenticating to another server through the server the client is conected to, using the credentials on the client.

		- First the ssh agent must be started and the ssh key added to the agent, after which connecting to the first server using the `-A` option is done. This forwards the credentials to the server for this session.

			```
				ssh -A username@remote_host
			```

			From here, one can SSH in to any other host that their SSH key is authorized to access. It connects as if the client's private SSH key is located on this server.




### Server-side configuration options

- These are some configuration options that can shape the way the server responds and what types of connections allowed.


	- #### Disabling the password Authentication

		- If SSH keys are configured, tested and working properly, it is probably a good idea to disable password authentication. This prevents any user from signing in with SSH using a password.

		- To do this, connect to the remote server and open the `/etc/ssh/sshd_config` file with root priviledges: - Inside the file, search for the `passwordAuthentication` directive, if commented out, uncomment it, set it to `no` to disable password logins:

			```
				/etc/ssh/sshd_config

				PasswordAuthentication no

			```

			After this operation, restart the SSH service.

			```
				sudo service ssh restart
			```


	- #### Changing the port that the SSH Daemon runs on

		- This is typically done to limit the number of authentication attempts the server is subjected to from automated robots.

		- To change the port that the SSH daemon listens on, log in to the remote server, open the `sshd_config` file on the remote system with root priviledges, then changing the port that SSH runs on by finding the entry for `Port 22` and modifying it to reflect the port one wishes to use.For instance to change the port to `4444`:

			```
				# Port 22
				Port 4444
			```

			To apply changes, save and restart the SSH daemon.


	- #### Limiting the Users who can connect through SSH

		- Takes different approaches, all of which rely on editing the ssh daemon config file:

		1. The first method of specifying the accounts that are allowed to login is using the `AllowUsers` directive. Search for this entry, if it doesn't exist, create it anywhere. Then list the user accounts that should be allowed to login through SSH:

			```
				AllowUsers [user1] [user2]

			```

		2. Using group management - through the `AllowGroups` directive. This adds a group that should be allowed SSH access.

			```
				AllowGroups [sshmembers]
			```

			Also, if the group does not exist it can be created through:

			```
				sudo groupadd -r sshmembers
			```
			Next is adding whatever user accounts needed in this group:

			```
				sudo usermod -a -G [sshmembers] [user1]
				sudo usermod -a -G [sshmembers] [user2]


	- #### Disabling Root login

		- It always advisable to completely disable root login through SSH after having set up an SSH user account that has `sudo` priviledges. To do this, open SSH daemon config file with the root priviledges on the remote server. Inside, find the `PermitRootLogin` and set the value to `no`:

			```
				PermitRootLogin no
			```


	- Allowing Root access for Specific commands:
