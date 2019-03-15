node default{

	#Apt::Source <| |> -> Class['apt::update'] -> Package <| |>
	#include ::docker	
	#include 'docker'
	#docker::image { 'ubuntu':
  	#	image_tag => 'trusty'
	#}	
#	include role::master_server
#	file { '/root/README':
#		ensure => file,
#		content => 'this is a README',
#		owner   => root,
		
#	}
	# Install package - vim on the node
#	package { 'vim':
#		ensure => present,
#	}	
}

node ubuntu {
	include role::master_server
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

