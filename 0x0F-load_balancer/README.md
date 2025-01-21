## 0x0F. LOAD BALANCER

- Provides for a mechanism to handle huge amounts of traffic, through multiple to tens of thousands of servers.
- The role of a load balancer in this setup is to distribute the web traffic to these tens of thousands of servers.
- There are two types of load balancers: 
	1.  ### Software load balancer
		- Installed on the server and consume the processor and memory of the server.

		- Generally implement a combination of one or more scheduling algorithms. The following are a few basic algorithms used by load balancers:

			- #### Weighted Scheduling Algorithm

				- Used when there is a considerable difference in capabilities and specifications of each server present in the farm or cluster.

				- Work is assigned to the server according to the weight assigned to the server. This weight is determined by the system administrator by considering the hardware capabilities of each server.

			- #### Round Robin Scheduling

				- Here, requests are sent to the various servers one after the other, sequentially, in such a manner such that the first request is sent to the first server, the second one to the second server etc until when the last server is reached, and then the cycle starts again from the first server. This round goes on as the requests keep coming.

				- Mostly used when the servers are of the same specification and there are not much persistent connections.


			- #### Least Connection First Scheduling

				- Requests are served first to the server which is currently handling the least number of persistent connections.

				- Mostly used when there is a large number of persistent connections in the traffic unevenly distributed between the servers. 

				- Often coupled with `Sticky Session` or `Session aware` load balancing, whereby all the requests related to a session is sent to the same server to maintain the session state and syncronization.


			- Load balancing softwares can have the smart implementation of a combination of the above 3 basic scheduling algorithms, such as `Weighted round robin` scheduling and `Weighted least connection` scheduling.


			- Examples of Software Load Balancers:

				1. `HAProxy` - A TCP load balancer.
				2. `NGINX` - A http load balancer with SSL termination support.
				3. `mod_athena` - Apache based http load balancer.
				4. `Varnish` - A reverse proxy based load balancer.
				5. `Balance` - Open source TCP load balancer.
				6. `LVS` - Linux virtual server offering layer 4 load balancing.




	2. ### Hardware load balancer

		- Are specialized hardware deployed in-between server and the client. Could be a switching/routing hardware or even a dedicated system running a load balancing software with specialized capabilities.

		- Are implemented on layer 4(Transport layer) and layer 7(Application layer) of the OSI model, giving rise to layer4 and layer7 routers.
			
			

			- #### Layer4 Hardware Load Balancing

				- Work on the transport layer of the OSI model and make use of TCP, UDP and SCTP transport layer protocol details to make decisions on which server the data is to be sent.

				- Are mostly the `Network Address Translators`(NATs) which share the load to the different servers getting translated to by these loadbalancer. 

				- These routers hide multiple servers behind them and translate every response data packets coming from the server to be coming from same ip address. Similarly, when there is a request, these routers translate the request using the mapping table and distribute it amongst the multiple servers.

					- ##### DNS load balancing
						- In a `DNS` based load balancing method, the Domain name servers are configured to return different ip address for different systems. This approach creates a load balancing effect whenever there is a dns lookup.


					- ##### Direct routing 
						- In this case the routers are aware of the server mac addresses and the server may be ARP(address resolution protocol) disabled.

						- All the incoming traffic is routed by the load balancer whereas all the outgoing traffic directly reaches the client. Is a relatively fast load balancing configuration due to this.


					- ##### Tunnel/IP Tunneling
						- Similar to direct routing whereby response is directly sent to the client, however the traffic between the router and the server can be routed.

						- The client sends the request to the virtual IP of load balancer which further encapsulates the IP packets, keeping a hash table and distributing it to the different servers as per the configured load balancing technique.

						- When the server gets back the response, id decapsulates it and sends it back to the client directly according to the hash table which it has stored. This recordis eventually deleted from the hash table when the connection is close or there is a timeout.




			- #### Layer7 hardware load balancing

				- Since HTTP exists on layer7 of the OSI model, this type of load balancers make the decision according to the actual content of the message(URLs, cookies, scripts etc).

				- These layer7 hardware actually form an `ADN (Application delivery network)` and they pass-on the request to the servers as per the type of content. for instance the request for an image will go to an image server, request for PHP scripts go to a different server, HTML, JS and CSS like static content may go to another one and a request for any media content may go to yet another server etc.
				- Here, load balancing effect is achieved by distributing load according to the type of content requested.

				- Uses the following techniques:

					1. URL parsing: From this, different types of contents are known
					2. Cookie sniffing: Helps for a session aware routing
					3. HTTP reading: Looks for http header information.


				- ##### Examples of hardware load balancers:

					1. `F5 BIG-IP` load balancer - setup HTTPS load balancer on F5.
					2. `CISCO` system catalyst
					3. `Barracuda` load balancer
					4. `Coytepoint` load balancer
