node ubuntu {
  #hiera_include(classes-debian)
  $packages = lookup(classes-debian)
  
  package { $packages:
    ensure => installed,
    }
 }
