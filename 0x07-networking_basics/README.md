## 0x07. Networking basics #0

- ### Networks:

- A common way to categorize computer networks is through the `scope` or `scale` of the network:

	- #### Types of Area Networks:

		- __LAN:__ - Local Area Network.
		- __WAN:__ - Wide Area Network.
		- __WLAN:__ - Wireless Local Area Network.
		- __MAN:__ - Metropolitan Area Network.
		- __SAN:__ - Storage/System/Server/Small  Area Network.
		- __CAN:__ - Campus/Controller/Cluster Area Network.
		- __PAN:__ - Personal Area Network.

		Of all these, `LAN` and `WAN` are the two primary and best-known categories of networks, based on the scale/scope of the network. The other categories have merged with technological advances.



	- #### LAN: Local Area Network

		- Connects network devices over a relatively short distance, e.g an office building, school or home.
		- Are typically owned, controlled and managed by a single person or organization.


	- #### WAN: Wide Area Netework

		- Spans a large physical distance. (The ___internet___ is the largest WAN, spanning the earth).
		- Is basically a geographically-dispersed collection of LANs interconnected through ***routers***.
		- Most are not owned by one organization, instead, exist under collective or distributed ownership and management, point in case, the internet.



	- #### Home Networking and Other types of Area Networks.

		- Residences typically employ one LAN and connect to the internet(WAN) through an `internet service provider`, ___ISP___ using a broadband `modem`.

		- The ISP provides a WAN IP address to the modem and all computers connected to the home network use LAN IP addresses (also known as private IP addresses) to connect to the WAN.

		- All computers on a home LAN can communicate directly with each other but must go through a central `netwok gateway`, typically a `broadband router` to reach the ISP and beyond.

	- #### Other network variants:

		-  Wireless Local Area Network(___WLAN___): A LAN that is just based on `Wi-Fi` wireless network technology.

		- Metropolitan Area Network: A network spanning an area larger than that of a LAN but smaller than that of a WAN, such as a network within a city. Typically owned and managed by a single entity such as a government body or large corporation.

		- Campus Area Network: A network spanning multiple LANs but smaller than a MAN, such as a university or local business campus.

		- Personal Area Network: A network that surrounds an individual. A wireless PAN (___WPAN___) might be created between bluetooth devices.

		- Storage Area Network: Connects servers to data storage devices through technology like `Fibre Channel`.

		- System Area Network, also Cluster Area Network(___CAN___): Links high-performance computers with high-speed connections in a cluster configuration.

		- Passive Optical Local Area Network(___POLAN___): Serves fiber by using fiber optic splitters to allow a single `optical fiber` to serve multiple devices.



		- Note that there's also networks focused on private networks e.g `virtual private networks(VPNs)` and `Enterprise private networks(EPNs)`


### MAC Address

- `Media Access Control` (___MAC___) address is a string of characters that identifies a device on a network.

- It is tied to a computers ___Network interface card___(__NIC__), a circuit card that makes it possible for the computer to connect to a network. It is responsible for transforming data into electric signals that can be transported over the network and eventually the internet.

- Every `NIC` has a `hardware` address, the `MAC` address.

- Just a side note, `IP` addresses are associated with `TCP/IP`, softaware, a networking software wheres `MAC` addresses are physically mapped onto the computer's network card.

- The ___Address Resolution Protocol___(`ARP`) translates an IP address into a MAC address.

- MAC addresses are more reliable in diagnostics since they do not change as opposed to the IP address that can change from time to time.

- Also, with regards to security, a router can be configured to accept traffic only from a specific MAC address, `MAC address filtering`. This way, computers whose MAC addresses are approved are able to communicate whereas the rest are restricted from communicating.

- In order to find the MAC address on a linux terminal, the command `ifconfig-a` should suffice as it displays information regarding all interfaces on the network, which is inclusive of the MAC address.


### IP Address

- A unique identifier assigned to every machine on the internet through `DHCP`, Dynamic Host Configuration Protocol, more like a telephone number for machines over the internet.

- Ip addresses exist in two formats, __IP address version 4__ (`IPv4`) and __version 6__(`IPv6`), With the version 6 set to replace the version 4 in future.

- Ipv6 is a 128-byte IP and provides more IP addressing for the ever increasing number of devices on the internet, smart devices etc etc.

- Ipv4 can only offer a maximum of 4,000,000,000 addresses and thereby the need for a different addressing system.


	- #### IPv4 Addresses

		- Consists of 4 numbers, seperated by periods, with numbers having a possible range of 0 to 255. e.g `192.168.20.3`

		- With every number having a range of 250, there is a possible total of 4, 294,967, 296 IP addresses.

		- Out of these, 3 are special addresses and include:

			- `0.0.0.0` - Default network

			- `255.255.255.255 - Broadcast address

			- `127.0.0.1` - Loopback address (refers to your machine).

		the first two are considered reserved IP addresses and are not considered usable.



		- #### IP address classes

			- | Class    | Start address      | Finish address          |
			  |---------------------------------------------------------|
			  |     A    |   0.0.0.0          |   126.255.255.255       |
			  | Loopback |   127.0.0.0        |   127.255.255.255       |
			  |     B    |   128.0.0.0        |   191.255.255.255       |
			  |     C    |   192.0.0.0        |   223.255.255.255       |
			  |     D    |   224.0.0.0        |   239.255.255.255       |
			  |     E    |   240.0.0.0        |   255.255.255.255       |
			  
