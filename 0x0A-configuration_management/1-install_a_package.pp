#!/usr/bin/pup
# install flask from pip3.
class flask {
  package { 'python3-pip':
    ensure => installed,
  }

  exec { 'install-flask':
    command => '/usr/bin/pip3 install flask',
    require => Package['python3-pip'],
  }
}

include flask

