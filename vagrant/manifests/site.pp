exec { "apt-get update":
  command => "/usr/bin/apt-get update",
}

# Basic packages
package { ["git", "vim"]:
  ensure => "latest",
  require => Exec["apt-get update"],
}

# hushfile-py-server specific
#package { ["python3", "python-pip", "python-cherrypy"]:
#	ensure => "latest",
#	require => Exec["apt-get update"],
#}

file {"/data":
  ensure => directory,
}

file {"/var/www":
  ensure => directory,
}

file {"/var/www/hushfile-web":
  ensure => link,
  target => "/home/vagrant/hushfile/hushfile-web",
  require => File["/var/www"]
}

file {"/home/vagrant/hushfile/hushfile-web/config.json":
  source => "file:///vagrant/web-config.json"
}

class { 'hushfile-server': }


#package { "apache2":
#	ensure => "latest",
#	require => Exec["apt-get update"]
#}
#
#service { "apache2":
#	enable => false,
#}
#
#package { ["libapache2-mod-proxy-html", "libapache2-mod-php5"]:
#	ensure => "latest",
#	require => Exec["apt-get update"],
#}
