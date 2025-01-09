## 0x08. Networking basics 

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
