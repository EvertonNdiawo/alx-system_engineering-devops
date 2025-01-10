## 0x0A. Configuration management


- ### Introduction

	- Configuration management (CM) is the process of systematically handling changes to a system in such a way that it maintains its integrity over time.

	- Popularly used to  refer to `Server configuration management` within the IT world.

	- CM tools are also known as `Automation tools` or `IT Automation tools`, simply because automation plays a crucial role in server configuration management.

	- Common terms used to refer to automation features implemented by CM tools are `Server Orchestration` or `IT Orchestration` just because these tools are typically able to manage multiple servers from one central controller machine.

	- The most popular configuration management tools available in the market are:
	
		1. Ansible
		2. Puppet
		3. Chef
		4. Salt

- ### Benefits of configuration management for servers

	1. __Quick provisioning of new servers:__ - Whenever a new server need to be deployed, the automation tool automates most if not all of the provisioning process, making provisioning much quicker and more efficient.

	2. __Quick recovery from critical events:__ - Suppose a server goes offline, it would be quicker to deploy a  replacement server so as to continue operations and then properly audit the failed server since it could take longer to audit the failed server at times. With CM, and automation, this can be done in a quick and reliable way.

	3. __Elimination of snowflake servers:__ - By using CM tools, the provisioning of a new server is well documented and these configuration settings are stored as code, often referred as __Infrastructure as Code__ (`IaC`). This eliminates the existence of snowflake servers, which are unique and difficult to reproduce due to the manual configuration typically used to configure them.

	4. __Version control for the server environment:__ - Version control tools such as `Git` can be used to keep track of changes made to the provisioning code and to maintain seperate branches for legacy versions of the scripts. Also, version control can be used to establish `code reviews` whereby all changes to the provisioning scripts should be submitted as pull requests and approved by a project lead before being accepted. 

	5. __Replicated environments:__ - CM helps replicate environments with the exact same software and configurations. This minimizes problems caused by environmental discrepancies that frequently occur when applications are shared between co-workers with different machine setups.



- ### General Overview of Configuration management tools and features


	- Even though unique, most CM tools share many characteristics and have similar concepts.

	- Most CM tools use a `Controller/Master` and `node/agent` model. The controller directs the configuration of the nodes, based on a series of instructions or tasks defined in the provisioning script.



	- #### Most common features present in majority of CM tools:

		1. Automation framework - Each tool provides a specific syntax and a set of features that can be used to write provisioning scripts. Include variables, loops and conditions, etc.

		2. Idempotent behaviour - CM tools keep track of the state of resources in order to avoid repeating tasks that were executed before. for instance is a package is previously installed, the tool will not try to install it again, thereby achieving consistency.

		3. System facts - CM tools provision for availing of data  about a system through global variables know as `facts`. The data includes but is not limited to: network interfaces, IP addresses, Operating system, etc etc.

		4. Templating system - Most CM tools provide inbuilt templating systems that can be used to facilitate setting up configuration files and services. The same template can be used across multiple servers.

		5. Extensibility - Using extensions provided by other users can save considerable amounts of time, while also serving as a way to learn how other users are implementing funcionality. Most CM tools provision for this feature.

	- #### Overview of popular CM tools

		- Table below provides a comparison between three of the most popular CM tools available in the market:

		| Feature                                | Ansible                                     | Puppet                                      | Chef                                      |
|----------------------------------------|---------------------------------------------|---------------------------------------------|-------------------------------------------|
| **Script Language**                    | YAML                                        | Custom DSL based on Ruby                    | Ruby                                      |
| **Infrastructure**                     | Controller machine applies configuration on nodes via SSH | Puppet Master synchronizes configuration on Puppet Nodes | Chef Workstations push configuration to Chef Server, from which Chef Nodes will be updated |
| **Requires Specialized Software for Nodes** | No                                          | Yes (Puppet Agent)                          | Yes (Chef Client)                         |
| **Provides Centralized Point of Control** | No, any computer can be a controller         | Yes, via Puppet Master                      | Yes, via Chef Server                      |
| **Script Terminology**                 | Playbooks / Roles                           | Manifests / Modules                         | Recipes / Cookbooks                       |
| **Task Execution Order**               | Sequential                                  | Non-sequential                              | Sequential                                 |



