class hushfile-server {
  # hushfile-server specific
  package { ["nginx", "php5-fpm", "php5-json"]:
    ensure => "latest",
    require => Exec["apt-get update"],
  }

  service { "nginx":
    enable => true,
    require => Package["nginx"]
  }

  file { "/etc/nginx/sites-available/dev.hushfile.it.conf":
    source => "puppet:///modules/hushfile-server/dev.hushfile.it.nginx.conf",
    require => Package["nginx"]
  }

  file {"/etc/nginx/sites-enabled/dev.hushfile.it.conf":
    ensure => link,
    target => "/etc/nginx/sites-available/dev.hushfile.it.conf",
    require => File["/etc/nginx/sites-available/dev.hushfile.it.conf"]
  }

  file {"/var/www/hushfile-server":
    ensure => link,
    target => "/home/vagrant/hushfile-server",
    require => File["/var/www"]
  }

  file {"/home/vagrant/hushfile-server/config.json":
    source => "file:///vagrant/server-config.json"
  }

  file {"/data/hushfile-server":
    ensure => "directory",
    owner => "www-data",
    group => "vagrant",
    require => File["/data"]
  }

}