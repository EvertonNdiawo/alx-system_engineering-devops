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


| Feature             | Ansible                    | Puppet                           | Chef                          |
|---------------------|----------------------------|----------------------------------|-------------------------------|
| **Script Language** | YAML                       | Custom DSL based on Ruby         | Ruby                          |
| **Infrastructure**  | Contrl => config  via SSH  | Pp master > config on Pp Nodes   | Chf Wrkstn => Chf Server,Nodes|
| **Specialized Soft**| No                         | Yes (Puppet Agent)               | Yes (Chef Client)             |
| **Centralized Ctrl**| No, any can be a controller| Yes, via Puppet Master           | Yes, via Chef Server          |
| **Scrpt Terminlogy**| Playbooks / Roles          | Manifests / Modules              | Recipes / Cookbooks           |
| **Task Exectn Order**| Sequential                | Non-sequential                   | Sequential                    |





- ### Puppet Resource:

	- #### Example of Puppet's file resource syntx

		- This file resource is used in puppet to manage files on target systems. This resource is used to ensure a specific file exists on a node and to control the properties of the file such as ownership, permissions, content etc.


		```
			file { 'resource title':
 			  path                    => # (namevar) The path to the file to manage.  Must be fully...
			  ensure                  => # Whether the file should exist, and if so what...
			  backup                  => # Whether (and how) file content should be backed...
			  checksum                => # The checksum type to use when determining...
			  checksum_value          => # The checksum of the source contents. Only md5...
			  content                 => # The desired contents of a file, as a string...
			  ctime                   => # A read-only state to check the file ctime. On...
			  force                   => # Perform the file operation even if it will...
			  group                   => # Which group should own the file.  Argument can...
			  ignore                  => # A parameter which omits action on files matching 
			  links                   => # How to handle links during file actions.  During 
			  mode                    => # The desired permissions mode for the file, in...
			  mtime                   => # A read-only state to check the file mtime. On...
			  owner                   => # The user to whom the file should belong....
			  provider                => # The specific backend to use for this `file...
			  purge                   => # Whether unmanaged files should be purged. This...
			  recurse                 => # Whether to recursively manage the _contents_ of...
			  recurselimit            => # How far Puppet should descend into...
			  replace                 => # Whether to replace a file or symlink that...
			  selinux_ignore_defaults => # If this is set then Puppet will not ask SELinux...
			  selrange                => # What the SELinux range component of the context...
			  selrole                 => # What the SELinux role component of the context...
			  seltype                 => # What the SELinux type component of the context...
			  seluser                 => # What the SELinux user component of the context...
			  show_diff               => # Whether to display differences when the file...
			  source                  => # A source file, which will be copied into place...
			  source_permissions      => # Whether (and how) Puppet should copy owner...
			  sourceselect            => # Whether to copy all valid sources, or just the...
			  target                  => # The target for creating a link.  Currently...
			  type                    => # A read-only state to check the file...
			  validate_cmd            => # A command for validating the file's syntax...
			  validate_replacement    => # The replacement string in a `validate_cmd` that...
			  # ...plus any applicable metaparameters.
			}
		```
