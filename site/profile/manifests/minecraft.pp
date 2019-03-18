class profile::minecraft {
  # includes the module created
  # include minecraft
  class { 'minecraft':
    install_dir => '/srv/minecraft',
  }
}
