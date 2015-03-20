# Deploy/Start/Stop/Update Apache

class roboconf_apache_module($runningState = undef, $importAdded = undef, $importRemoved = undef, $importComponent = undef, $node_name = undef, $ip = undef, $loadbalance_able = undef)  {

  package{'apache2':
    ensure => present,
    before => Service['apache2'],
  }

  package{'libapache2-mod-jk':
    ensure  => present,
    before  => Service['apache2'],
    require => Package['apache2'],
  }

  if $loadbalance_able != undef {
    file{'/etc/libapache2-mod-jk/workers.properties':
      ensure  => file,
      content => template('roboconf_apache_module/workers.properties.erb'),
      owner   => 'root',
      group   => 'root',
      notify  => Service['apache2'],
      require => Package['libapache2-mod-jk'],
    }
  }

  file{'/etc/apache2/sites-available/000-default.conf':
    ensure  => file,
    source  => 'puppet:///modules/roboconf_apache_module/000-default.conf',
    owner   => 'root',
    group   => 'root',
    notify  => Service['apache2'],
    require => Package['apache2'],
  }

  service{'apache2':
    ensure    => $runningState,
    enable    => true,
    require   => Package['apache2'],
    subscribe => Package['apache2', 'libapache2-mod-jk'],
  }


 
}

