node default{


}

node ubuntu {
	include role::master_server
	file { '/root/README':
		ensure => file,
		content => 'this is a README',
		owner   => root,
		
	}
	
	file { '/root/TEST_PUPPET':
		ensure => present,
		#content => $fqdn,
		content => "Welcome to ${fqdn}",
	}
	# Install package - vim on the node
	package { 'vim':
		ensure => present,
	}	
	
	package { 'python':
		ensure => present,
	}
}

node /^web/ {
	include role::app_server
}

node /^db/ {
	include role::db_server
}

