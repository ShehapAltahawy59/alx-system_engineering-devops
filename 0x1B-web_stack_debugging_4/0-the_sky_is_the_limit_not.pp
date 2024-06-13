# Fixing the number of failed requests to get to 0
exec { 'fix--for-nginx':
  command => "sed -i 's/worker_processes 4;/worker_processes 7;/g' /etc/nginx/nginx.conf; ",
  path    => ['/bin', '/usr/bin', '/usr/sbin']
}
# Restart Nginx
exec { 'nginx-restart':
  command => 'nginx restart',
  path    => '/etc/init.d/'
}
