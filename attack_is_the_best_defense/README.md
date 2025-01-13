## Attack is the best defense

- ### Network Sniffing

	- Involves the use of softwares or hardware running these softwares, a network sniffer, to monitor or sniff the data flowing over a computer network in real-time.

	- Network sniffers generally take snapshot copies of the data that is flowing over a network without altering or redirecting it.
	
	- Network sniffers are also known as network probes, wireless sniffers, Ethernet sniffers, packet sniffers, packet analyzers, or snoops.



	- #### How network sniffing works

		- A packet sniffer intercepts all the data flowing over the network it is connected.

		- For instance, in a local LAN setting, computers are connected to other computers within the network and are generally configured to ignore traffick that is not directed to them and their IP addresses. A network sniffer on such a network opens up to all traffic by opening up the computer's NIC to listen to that traffic. Once the network data is accessed, a packet sniffer performs the following actions:

			1. The contents or individual packets are recorded.

			2. Captured network data is then decoded and formatted so that the user can  view theis information. Packet sniffers analyze errors in a network communication, troubleshoot the network connections and reconstruct entire data streams intended for other computers.

			3. some network sniffing software retrieve sensitive information like passwords, PINs and private information.


	- #### Network sniffer tools

		1. __Wireshark__: - Formerly known as __Ethereal__, recognized as the world's most popular network sniffer.

		2. __tcpdump__: - A command line tool for linux and unix-based OSs.

		3. __CloudShark__

		4. __Cain and Abel__

		5. __CommView__

		6. __Omnipeek__

		7. __Capsa__

		8. __Ettercap__

		9. __PRTG__

		10. __NetworkMiner__

		11. __IP Tools_



### ARP Spoofing

- A type of cyberattack whereby the attacker sends fake, falsified ARP (Address Resolution Protocol) messages on a local network. 

- If successful, the attackers MAC address is linked to an authentic IP address of a device within the system and the attacker receives the data that is intended for that particular IP address.

- ARP spoofing can be used to facilitate the following other attacks:

		- ___Denial-of-Service attacks___: Often achieved by linking multiple IP addresses with a single target's MAC address, thereby the traffic that is intended for all these many IP addresses is redirected to a target's MAC address, overloading the target with traffic. The attacker may also stop traffic by not forwarding packets after intercepting them.


		- ___Session hijacking___: Whereby ARP spoofing is used to steal __session IDs__, thereby granting attackers access to private systems and data.

		- ___Man-in-the-middle attacks___: Using ARP to intercept and modify traffic between victims.




	- #### How ARP spoofing works

		- Attacker sends malicious ARP replies to the victim or the router, pretending to be the another device.e.g the attacker claims, "I am the router and my MAC is XX:XX:XX:XX:XX."

		- The victim and/or router updates its ARP table with the attacker's MAC address, associating it with the IP address of the target device.

		- Traffic intended for the legitimate device is now sent to the attacker since theirMAC address is associated with the legitimate device's IP address.
