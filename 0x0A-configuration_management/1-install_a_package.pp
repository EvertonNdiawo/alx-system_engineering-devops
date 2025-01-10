# A puppet manifest to installs the package 'flask -version 2.1.0' from pip3

exec { 'install flask':
  command => 'pip3 install flask==2.1.0',
  path    => '/usr/bin',
  unless  => 'pip3 list | grep flask',
}
