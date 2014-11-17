exec { "apt-get update":
  command => "/usr/bin/apt-get update",
}

# Basic packages
package { ["git", "vim"]:
  ensure => "latest",
  require => Exec["apt-get update"],
}

# hushfile-server specific
package { ["nginx", "php5-fpm", "php5-json"]:
  ensure => "latest",
  require => Exec["apt-get update"],
}

file { "/etc/nginx/sites-available/dev.hushfile.it.conf":
  source => "file:///vagrant/dev.hushfile.it.nginx.conf",
  require => Package["nginx"]
}

file {"/etc/nginx/sites-enabled/dev.hushfile.it.conf":
  ensure => link,
  target => "/etc/nginx/sites-available/dev.hushfile.it.conf",
  require => File["/etc/nginx/sites-available/dev.hushfile.it.conf"]
}

file {"/var/www":
  ensure => directory,
}

file {"/var/www/hushfile-web":
  ensure => link,
  target => "/home/vagrant/hushfile-web",
  require => File["/var/www"]
}

file {"/var/www/hushfile-server":
  ensure => link,
  target => "/home/vagrant/hushfile-server",
  require => File["/var/www"]
}

file {"/home/vagrant/hushfile-web/config.json":
  source => "file:///vagrant/web-config.json"
}

file {"/home/vagrant/hushfile-server/config.json":
  source => "file:///vagrant/server-config.json"
}

file {["/data", "/data/hushfile-server", "/data/hushfile-py-server"]:
  ensure => "directory",
  owner => "www-data",
  group => "vagrant"
}
