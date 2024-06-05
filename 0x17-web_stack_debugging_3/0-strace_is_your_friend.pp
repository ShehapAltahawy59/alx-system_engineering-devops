
# Fixes bad `phpp` extensions to `php`
class { 'apache':
  default_vhost => false,
}

apache::vhost { 'my_site':
  port    => '80',
  docroot => '/var/www/html',
  directories => [
    { 
      path            => '/var/www/html',
      options         => ['Indexes','FollowSymLinks','MultiViews'],
      allow_override  => ['All'],
      require         => ['all granted'],
      directoryindex  => 'index.php',
    },
  ],
}
