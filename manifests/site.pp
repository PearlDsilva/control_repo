node ubuntu {

  notify { hiera(motd::message): }
  #hiera_include(classes-debian)
  #$packages = lookup(classes-debian)
  
  #package { $packages:
   # ensure => installed,
   # }
 }
