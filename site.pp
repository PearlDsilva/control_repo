node default {
    file { '/root/test_file':
        ensure => file,
	content => "testing puppet script by creating this file through file resource",
	owner => root,
    }
} 
