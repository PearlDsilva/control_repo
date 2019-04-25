node ubuntu {

  notify { hiera(motd::message): }
  #hiera_include(classes-debian)
  #$packages = lookup(classes-debian)
  
  #package { $packages:
   # ensure => installed,
   # }
     case $:osfamily {
        'Debian' : { notify { "Debian":} }
        'RedHat' : { notify {"RedHat":}}
  }
 }

node default {
  
  #include firewalld
  #class { ::firewalld::ports: }
  #$packages = lookup('firewalld::ports')
  #lookup('debian-classes').include
  hiera_include('classes-debian')
  #include $package

}
