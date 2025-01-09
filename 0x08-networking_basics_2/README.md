## 0x08. Networking basics #1 


- ### Local host

	- ___local host___ is a hostname that refers to the current computer used to access it.

	- This name is reserved for ___loopback___ purposes and is used to access the network services that are running on the host via the loopback network interface.

	- Also to note is that using the loopback interface bypasses any local network interface hardware.


- ### Loopback

	- By provisioning for loopback mechanisms, it is possible to run a network service without making the service accessible to other computers in the same network a computer is connected to. example is running a locally installed website by accessing it through the `URL`: ___http://localhost___ , which displays its home page.

	- While using IPv4, the network address block ___127.0.0.0/8___ is reserved for loopback purposes, meaning any packet sent to any of those addresses is looped back.

	- The standard address for loopback however is ___127.0.0.1___ on most systems, since the rest are not universally accepted by all operating systems.

	- These other addresses can however be used to set up multiple server applications on the host, all listening on th same port number.

	- With the IPv6 architecture, only one single loopback address exists: `::1`


- ### Name Resolution

	- ___localhost___ normally resolves to the IPv4 loopback address ___127.0.0.1___, and to IPv6 loopback IP address ___::1___.

	- A result of the following configuration in the operating system's `hosts` file:

		```
			127.0.0.1	localhost
			::1		localhost
		```

	- This same name resolution is achieved by the DHCP, following certain guidelines outlined by the protocol.


	- To note is that `localhost` can also be mapped to other loopback addresses either through the `hosts` file or `DHCP` but could sometimes have undesired effects.

- ### 0.0.0.0

	- #### Uses

		- Prohibited for use as a `destination` IP address in IPv4 and only allowed as a source address under specific circumstances.

		- An example of such a circumstance is when a host uses this IP address, 0.0.0.0 as uts source address when it has not yet been asigned an address, point in case, when sending the first initial __DHCPDISCOVER__ packet when using `DHCP`.

		- In both windows and linux, when selecting which of a host's IP addrss to use as a source IP, a program may specify __INADDR_ANY(0.0.0.0)__. This specifies any valid IP address in the system, or rather all valid source IP addresses in the system.(__0.0.0.0/0__)

		- In linux, a program may specify 0.0.0.0 as the remote address to connect to the current host(AKA localhost).

		- This IP address can also be used as a way to indicate that the target is unavailable.

	- In IPv6, this address is represented by: `::` which is short for __0000.0000.0000.0000.0000.0000.0000.0000__



- ### The hosts file on Linux

	- A hosts file is a plain text file that all operating systems use to translate hostnames(__URLs__) into IP addresses. e.g when a user types a hostname such as wikipedia.org, the user's system looks into the hosts file to get the IP address needed to connect to the appropriate server.

	- Given that the system first checks the host file before looking up a site on the `DNS` servers defined by a network, it is then possible to use the hosts file to add to what DNS servers cannot provide for, e.g aliases to locations on a local network, overriding IP addresses that a DNS server would normally provide etc etc.


	- This file is located in `etc/hosts` and can be accessed and modified with administrative rights.


	- Hosts file can also be used to create easy to remember names of machines on a local network. e.g a computer with an IP address `192.168.1.10` that has a server useful to a user could be named as so in the hosts file:

		```
			192.168.1.10	simpleserver
		```

		Then, by typing ___http://simpleserver__, the user's computer automatically redirects to 192.168..., the specified IP address for the machine in the hosts file.


	- This hosts file could also be used to creat a shortcut to frequented sites by the user. By using a tool such as `nslookup` to find IP addresses for such sites and listing them in the hosts file, with a shortcut name to use when browsing.



- ###  The Netcat (nc) Command


	- Netcat is a networking utility for debugging and investigating the network.

	- Can be used for creating TCP/UDP connections, sockets and investigating them.


	- #### 1. Netcat in a client-server architecture

		- Can be run in the `server` mode on a specified port listening for incoming connections:
		```
			$ nc -l 2389
		```


		- can be used in `client` mode to connect to an opened port e.g port 2389 above:

		```
			$ nc localhost 2389
		```

		- Now this is how this established connection works:

			```
				#On the client:
				$ nc localhost 2389
				Hi, server

				#On the server:
				$ nc -l 2389
				Hi, server
			```



	- #### 2. Netcat in file transfer:

		- Suppose at the client side there resides a file named 'testfile' containing:
		```
			$ cat testfile
			hello test
		```

		and at the server side an empty file 'test', now runiing this on the server:

		```
			$ nc -l 2389 > test
		```

		and running this on the client:
		```
			cat testfile | nc localhost 2389
		```

		this canges the test file at the server to be 'hello test' same as what was in the client file.


