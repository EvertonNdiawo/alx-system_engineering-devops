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

		


