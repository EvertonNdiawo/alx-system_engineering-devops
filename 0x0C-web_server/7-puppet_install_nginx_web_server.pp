# Manifest to configure a web server.
# Nginx should be listening on port 80
# when querying at the root / with Get request using curl,
#  returns a page containing the string Hello World!
# A 301 redirection is defined

package { 'nginx':
  ensure => installed,
}


ufw::rule { 'allow_http':
  port   => '80',
  action => 'allow',
}


file { 'index.html':
  ensure  => 'present',
  path    => '/var/www/html/index.html',
  content => '<html><body><h1>Hello World!</h1></body></html>',
  mode    => '0644',
}


file { 'custom_404.html':
  ensure  => 'present',
  path    => '/var/www/html/custom_404.html',
  content => "<html><body><p>Ceci n'est une page</p></body></html>",
}


file {'default':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  content => "
server {
	listen 80 default_server;
	listen [::]:80 default_server;


	root /var/www/html;
	index index.html index.htm index.nginx-debian.html;


	server_name _;


	location /redirect_me {
		return 301 https://www.youtube.com;
	}

	error_page 404 /custom_404.html;
	location = /custom_404.html {
		internal;
	}

	location / {
		try_files \$uri \$uri/ =404;
	}
}",
}


exec { 'service nginx restart':
  path => '/etc/nginx/sites-available/default',
}
