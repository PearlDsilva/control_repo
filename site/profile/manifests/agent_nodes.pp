class profile::agent_nodes{
  include docker
  include dockeragent
  # dockeragent::node {'web.puppet.vm':}
  # dockeragent::node {'db.puppet.vm':}
  docker::run { 'web.puppet.vm':
  image   => 'ubuntu:latest',
  command => '/bin/sh -c "while true; do echo hello world; sleep 1; done"',
  }
  docker::run { 'db.puppet.vm':
  image   => 'ubuntu:latest',
  command => '/bin/sh -c "while true; do echo hello world; sleep 1; done"',
  }
}
  
