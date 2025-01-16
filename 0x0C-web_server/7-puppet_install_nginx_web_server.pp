package { 'nginx':
     ensure => installed,
}


ufw::rule { 'allow_http':
  port   => '80',
  action => 'allow',
}


file { '/var/www/html/index.html':
  ensure  => file,
  content => "<html><body><h1>Hello World!</h1></body></html>",
}


file { '/var/www/html/custom_404.html':
  ensure  => file,
  content => "<html><body><p>Ceci n'est une page</p></body></html>",
}


file {'/etc/nginx/sites-available/default':
  ensure  => file,
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

	location /error {
		return 404 /custom_404.html;
		internal;
	}

	location / {
		try_files \$uri \$uri/ =404;
	}
}",
}
