# A puppet manifest to installs the package 'flask -version 2.1.0' from pip3

package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
