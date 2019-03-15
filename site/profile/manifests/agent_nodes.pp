class profile::agent_nodes{
  include docker
  #include dockeragent
  #dockeragent::node {'web.puppet.vm':}
  #dockeragent::node {'db.puppet.vm':}
  docker::run { 'web.puppet.vm':
  #image   => 'ubuntu:latest',
  image => 'agent',
  net => 'dockeragent-net'
  command => '/lib/systemd/systemd',
  env =>  [
   'RUNLEVEL=3',
   'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/puppetlabs/bin',
   'HOME=/root/',
   'TERM=xterm'
  ],

  }
  docker::run { 'db.puppet.vm':
  image => 'agent',
  net => 'dockeragent-net'
  command => '/lib/systemd/systemd',
   env =>  [
    'RUNLEVEL=3',
    'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/puppetlabs/bin',
    'HOME=/root/',
    'TERM=xterm'
   ],

   }
}
  
