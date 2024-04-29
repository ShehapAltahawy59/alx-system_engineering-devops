# Install Nginx
package { 'nginx':
  ensure => installed,
}

# Set up the default Nginx configuration
file { '/etc/nginx/sites-available/default':
  content => "
    server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;
        index index.html;

        location /redirect_me {
            return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
        }

        error_page 404 /404.html;
        location = /404.html {
            internal;
        }

        add_header X-Served-By \$hostname;
    }
  ",
  require => Package['nginx'],
}

# Create the HTML files
file { '/var/www/html/index.html':
  content => 'Hello World!',
  require => Package['nginx'],
}

file { '/var/www/html/404.html':
  content => "<p>Ceci n'est pas une page</p>",
  require => Package['nginx'],
}

# Restart Nginx service
service { 'nginx':
  ensure => running,
  enable => true,
  require => File['/etc/nginx/sites-available/default'],
}
