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

		- Are specialized hardware deployed in-between server and the client. Could be a switchind/routing hardware or even a dedicated system running a load balancing software with specialized capabilities.

		- Are implemented on layer 4(Transport layer) and layer 7(Application layer) of the OSI model, giving rise to layer4 and layer7 routers.
			
			

			- #### Layer4 Hardware Load Balancing

				- 
