#install flask 2.1.0 using pip3
exec { 'install flask with dependencies':
  command => 'pip3 install flask==2.1.0 werkzeug==2..3',
  path    => ['/usr/bin', '/bin'],
  unless  => 'pip3 list | grep flask | grep 2.1.0',
}
