# Ensures the SSH client configuration file exists and is configured properly

file { '/home/ubuntu/.ssh/config':
  ensure  => 'file',
  content => '
Host *
  IdentityFile ~/.ssh/school
  PasswordAuthentication no
',
}
