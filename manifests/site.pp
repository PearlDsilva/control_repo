node ubuntu {
  #hiera_include(classes-debian)
  $packages = loopup(classes-debian)
  
  package { $packages:
    ensure => installed,
    }
 }
