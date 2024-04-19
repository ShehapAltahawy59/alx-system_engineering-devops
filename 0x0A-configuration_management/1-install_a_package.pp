# 1-install_a_package.pp

package { 'flask':
  ensure   => '2.1.1',
  provider => 'pip3',
}
