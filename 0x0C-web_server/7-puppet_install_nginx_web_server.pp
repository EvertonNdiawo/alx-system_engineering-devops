# Manifest to configure a web server.
# Nginx should be listening on port 80
# when querying at the root / with Get request using curl,
#  returns a page containing the string Hello World!
# A 301 redirection is defined


$config = "server {
        listen 80 default_server;
        listen [::]:80 default_server;


        root /var/www/html;
        index index.html;

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
}"


package { 'nginx':
  ensure => 'installed',
}


file { 'index.html':
  ensure  => 'present',
  path    => '/var/www/html/index.html',
  content => '<html><body><h1>Hello World!</h1></body></html>',
  mode    => '0644',
}

file {'default':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  content => $config,
}

exec { 'service nginx restart':
  path => ['/usr/sbin', '/usr/bin']
}
