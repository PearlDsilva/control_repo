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
	
	class { packages::package_install:
		version => '59.0.2+build1-0ubuntu1',
	}
}
