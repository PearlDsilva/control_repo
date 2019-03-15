node default{

 	apt::key { '9DC858229FC7DD38854AE2D88D81803C0EBFCD88':
    		source => 'https://download.docker.com/linux/ubuntu/gpg',
	  } ->
  	apt::source { 'docker-ce':
    		architecture => 'amd64',
  		location     => 'https://download.docker.com/linux/ubuntu',
   		repos        => 'stable',
   		release      => $::lsbdistcodename,
 	 } ->
 	 package { 'docker-ce':
  		ensure  => 'latest',
    		require => Exec['apt_update'],
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

