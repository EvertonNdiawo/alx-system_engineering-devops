#Kills a process named killmenow.

exec { 'execute_a_command':
  command => 'pkill killmenow',
  path    => ['/bin', '/usr/bin']
}
