class minecraft (
  $url = 'https://launcher.mojang.com/v1/objects/3737db93722a9e39eeada7c27e7aca28b144ffa7/server.jar',
  $install_dir = '/opt/minecraft'
  ){
  file { $install_dir:
    ensure => directory,
  }
  file { "${install_dir}/server.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  package { 'java':
    ensure => present,
  }
  file { "${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }
  file { '/etc/systemd/system/minecraft.service':
    ensure => file,
    # source => 'puppet:///modules/minecraft/minecraft.service',
    # This is when we have created a template for dynamically loading the service file so, we use function here the funtion is epp itself
    # as we created a minecraft.service.epp template file
    # syntax : function('module_name/directory_name/(or)file_name',{parameters_to_be_passed_to template})
    content => epp('minecraft/minecraft.service',{
        install_dir => $install_dir,
      })
  }
  service { 'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'], File["${install_dir}/eula.txt"], File['/opt/systemd/system/minecraft.service']],
  }  
}
