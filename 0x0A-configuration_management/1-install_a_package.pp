# A puppet manifest to install a package.
# Installs flast
# Version 2.1.0
#

package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
