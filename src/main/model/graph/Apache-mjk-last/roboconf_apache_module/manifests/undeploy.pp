# Undeploy Apache

roboconf_apache_module::undeploy($runningState = undef, $importAdded = undef, $importRemoved = undef, $importComponent = undef, $node_name = undef, $ip = undef, $loadbalance_able = undef)  {
  
	exec { "undeploy_apache":
	user 	=> root,
	path   => "/usr/bin:/bin:/usr/sbin:/sbin",
	command => "apt-get -y purge apache2",
	}->
	exec { "undeploy_autoremove":
	user 	=> root,
	path   => "/usr/bin:/bin:/usr/sbin:/sbin",
	command => "apt-get -y autoremove",
	}
}
