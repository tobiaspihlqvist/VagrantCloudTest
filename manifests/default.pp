node default {
 exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
}
}

node'appserver' { 
 exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
}
package { 'npm' :
	ensure => "installed",
require => Exec['apt-get update']
}
package { nodejs:
	ensure => "installed",
require => Exec['apt-get update']
}
}

node 'dbserver' {
 exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
}
  package { "mysql-server": }
    exec { 'set-mysql-password':
                path => ['/bin', '/usr/bin'],
                command => "mysqladmin -u root password hejhej123",
                require => Service['mysql'],
        }
	
service { "mysql":
    ensure => "running",
    enable => "true",
    require => Package["mysql-server"],
}
}
