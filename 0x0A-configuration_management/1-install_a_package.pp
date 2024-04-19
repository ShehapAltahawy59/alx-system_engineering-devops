#!/usr/bin/pup
# install flask from pip3.
exec { 'install-werkzeug':
    command => '/usr/bin/pip3 install Werkzeug==2.0.0',
    require => Package['python3-pip'],
  }
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
