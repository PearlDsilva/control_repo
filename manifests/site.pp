node default{
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

include ::docker 

node /^web/ {
	include role::app_server
}

node /^db/ {
	include role::db_server
}

#node 'ubuntu' {
#	include role::master_server
}
