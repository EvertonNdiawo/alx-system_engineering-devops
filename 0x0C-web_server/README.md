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


		- ##### Step 3: Creating server block configuration files for Each Domain


			- As discussed above, nginx contains one server block called `default` which can be used as a template for configurations. Each domain name however needs their own server block, which tells nginx how to serve its contents.


			- ###### Creating a server block configuration file

				- In nginx, main configuration file, that controls global settings is found at `/etc/nginx/nginx.conf`
				- Site-specific configuration files are found at `/etc/nginx/sites-available/[site config file]`:


					```
						/etc/nginx/sites_available/example.com

						server {
						   listen 80 default_server;
						   server_name [example.com www.example.com;

						   root /var/www/example.com/html;
						   index index.html;


						   location / {
							try_files $uri $uri/ =404;
						   }
						}
					```

					- To note is that only one server block on the server can havethe `default_server` option enabled. And it specifies which block should server a request if the `server_name` requested does not match any of the available server blocks. Without this directive, the default server block serves the contents of /var/www/html directory if the requested host cannot be found.

					- The `root` directive adjusts the document root, pointing it to the site's document root that was earlier on created.

					- The server name directive sets aliases to match requests for a domain.

					- Depending on the number of sites hosted on the server, any of the server blocks gets a configuration file that specifies how its content is served.


		- ##### Step 4: Enabling server blocks and restarting nginx

			- This is done by creating symbolic links from the server block files to the `sites_enabled` directory, which nginx reads from during startup.


				```
					sudo ln -s /etc/nginx/sites-available/[example.com] /etc/nginx/sites-enabled/
					sudo ln -s /etc/nginx/sites-available/[test.com] /etc/nginx/sites-enabled/

				```

					- The sites are now linked into the enabled directory, with three server blocks enabled, which are configured to respond based on their `listen` directive and the `server_name`:

						- `example.com`: responds to requests for `example.com` and `www.examples.com`
						- `test.com`: responds to requests for `test.com` and `www.test.com`
						- `default`: Responds to any requests on port 80 that do not match the other two blocks.


			- Next is to test and make sure there are no syntax errors in any of the nginx files:
				```
					$ sudo nginx -t
				```

			- If no problems are found, restart nginx to enable the changes:

				```
					$ sudo systemctl restart nginx
				```


		- ##### Step 5: (Optional) Configuring DNS

			- If a website is to be accessible via a domain name, the domain name needs to be pointed to the server:

				1. Go to the domain name provider
				2. Add an A Record pointing the domain to server's public IP address
				3. Allow time for DNS propagation ( could take up to 24hours)


			- An alternative exists for testing purposes, whereby a local computer is used as the domain name provider, for testing purposes. In linux, this is done by editing the `/etc/hosts` directory and specifying the loopback ip address to intercept requests that would usually go to the DNS to resolve domain names. The desired IP addresses the local computer goes to when the requested domain names are encountered is specified:


				```
					/etc/hosts

					127.0.0.1	localhost
					...

					203.0.113.5	example.com www.example.com
					203.0.113.5	test.com www.test.com

				```

				This intercepts any requests for example.com and test.com and sends them to the server, if the domain names are not yet owned etc.



		- ##### Step 6: Testing the results

			- This can be done by visiting the domain names in a web browser. e.g `http://example.com`


## Domains and subdomains

- Internet domain is the identity or representation (in form of letters) of an IP address. Domains come in handy simply because it is easier to remember names than the IP address digits.

- A Domain Name System (DNS) translates this identity in the form of letters into an IP address that can be accessed by a web browser etc.

- Example of internet domain name: `https://www.landingi.com/call-to-action/`

- A subdomain belongs to the root domain. Typically, a domain is bought once and then as many subdomains as are allowed by the domain name provider can be created through the domain name registra's account. An example is a root domain such as `tafariclarinets.com`, from this a subdomain such as `bookings.tafariclarinets.com` can be registered to handle the concert bookings etc.

- Subdomains are usually redirected using the `A records` from the domain name registra/ provider.



### HTTP requests

	- ### HTTP Methods


		- HTTP request methods specify the action to be performed on resources. The set of common methods for HTTP/1.1 are defined below: 

		- The method names are case sensitive and must be used in UPPERCASE.


			| Method | Description |
			|--------|-------------|
			| **GET** | Retrieves information from the given server using a given **URI**. Only retrieves data and has no other effect on the data |
			| **HEAD** | Same as GET, but transfers the status line and header section only. |
			| **POST** | Used to send data to the server, e.g customer information, file upload etc using HTML forms. |
			| **PUT** | Replaces all current representation of a target resource with the uploaded content. |
			| **DELETE** | Removes current representations of the target resource given by a URI. |
			| **CONNECT** | Establishes a tunnel to the server identified by a given URI. |
			| **OPTIONS** | Describes the communication options for the target resource. |
			| **TRACE** | Performs a message loop-back test along the path to the target resource. |
