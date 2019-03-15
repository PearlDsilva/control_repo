node default{
	
	class { 'apt': }
 
	apt::key { 'powerdns':
  		ensure => present,
  		id     => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
  		source => 'https://repo.powerdns.com/FD380FBB-pub.asc',
}
	include ::docker 
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

