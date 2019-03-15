node default{

	
	include 'docker'
	file { '/root/README':
		ensure => file,
		content => 'this is a README',
		owner   => root,
		
	}
	# Install package - vim on the node
	package { 'vim':
		ensure => present,
	}	
}



node /^web/ {
	include role::app_server
}

node /^db/ {
	include role::db_server
}

