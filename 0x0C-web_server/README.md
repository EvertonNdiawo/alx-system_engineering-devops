## 0x0C. Web Server

- The internet is highly reliant on a client-server architecture to facilitate information exchange.

- Clients request for resources while servers store these resources in the form of webpages, sites, maps etc and when a client requests for these resources, say through the web browser, a copy of the resource is sent to the client by the server.

- Some notable industry players in the web servers field include: 

	- NGINX
	- Apache
	- Cloudflare servers
	- Microsoft Internet Information Services etc.

- In this project, the focus is on `NGINX` or `nginx`, pronounced ___Engine x___, a web server that can also be used as a ___reverse proxy___, a ___load balancer___, a ___mail proxy___ and an ___HTTP cache___.



- ### How to configure Nginx

	- #### How to set-up Nginx Server blocks ( virtual hosts) on Ubuntu 16.04 server

		- Server blocks are used in Nginx to encapsulate configuration details and to host more than one domain on a single server. 



		- ##### Step 1: Setting up New Document Root Directories

			- By default nginx on Ubuntu 16.04 server has one server block enabled. It is configured to serve documents out of a directory at `/var/www/html`. This works well for a single site but additional directories are necessary if multiple sites are to be served.

			- The `/var/www/html` directory is considered the default directory and it is the directory that is served suppose the client request does not match any other sites.

			- For multiple sites serving, a directory structure is created within the `/var/www` directory for each of the sites to be hosted. Actual web content is placed in an `html` directory within these site-specific directories.

			- By doing this, the other directories created are siblings to the `html` directory. The `-p` flag used alongside the `mkdir` command instructs the command to create any necessary parent directories along the path specified:

				```
					$ sudo mkdir -p /var/www/[example.com]/html
					$ sudo mkdir -p /var/www/[test.com]/html

				```
				This creates two directories within the `/var/www` directory for an `example.com` site and another one for the `test.com` site. In each of these site directories are `/html` directories where resources for each site will be stored.


			- Next, it is important to reassign ownership of the site directories to normal user account, (since the default site directory is root before creating these other directories). One way of doing this is through the `$USER` environment variable to assign ownership to the account currently signed in on, making it easy to create or edit the contents in this directory:

				```
					$ sudo chown -R $USER:$USER /var/www/[example.com]/html
					$ sudo chown -R $USER:$USER /var/www/[test.com]/html
				```

				- It is also important to verify that the permissions of the roots directory is correctly specified:
				```
					$ sudo chmod -R 755 /var/www
				```
				- For instance, this makes sure the user owns the directory and others can only read the files in the directory.

		- ##### Step 2: Creating sample pages for each site

			- Here, files for each domain are created inside the `/html` directory of the specific domain. This can be done from the server:

				```
					$ nano /var/www/[example.com]/html/[index.html]
				```

			- After this, the two sites should be able to display the content in the index.html pages as a webpage.


		- ##### Set 3: Creating server block configuration files for Each Domain


			- As discussed above, nginx contains one server block called `default` which can be used as a template for configurations. Each domain name however needs their own server block, which tells nginx how to serve its contents.


			- ###### Creating a server block configuration file

				- In nginx, main configuration file, that controls global settings is found at `/etc/nginx/nginx.conf`
				- Site-specific configuration files are found at `/etc/nginx/sites-available/[site config file]`:
