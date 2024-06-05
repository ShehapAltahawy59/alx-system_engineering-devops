
# Fixes bad `phpp` extensions to `php`

node 'default' {
  # Ensure the index.html file exists with the specified content
  file { '/var/www/html/index.html':
    ensure  => 'file',
    content => '
    <title>Holberton – Just another WordPress site</title>
    <link rel="alternate" type="application/rss+xml" title="Holberton » Feed" href="http://127.0.0.1/?feed=rss2" />
    <link rel="alternate" type="application/rss+xml" title="Holberton » Comments Feed" href="http://127.0.0.1/?feed=comments-rss2" />
    <div id="wp-custom-header" class="wp-custom-header"><img src="http://127.0.0.1/wp-content/themes/twentyseventeen/assets/images/header.jpg" width="2000" height="1200" alt="Holberton" /></div>
    <h1 class="site-title"><a href="http://127.0.0.1/" rel="home">Holberton</a></h1>
    <p>Yet another bug by a Holberton student</p>
    ',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
  }
}
