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
