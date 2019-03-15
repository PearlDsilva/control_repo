class profile::agent_nodes{
  include docker
  #include dockeragent
  #dockeragent::node {'web.puppet.vm':}
  #dockeragent::node {'db.puppet.vm':}
  docker::run { 'web.puppet.vm':
  #image   => 'ubuntu:latest',
  image => 'puppet/puppet-agent',
  net => 'dockeragent-net',
  command => '/bin/sh -c "while true; do echo hello world; sleep 1; done"',
  env =>  [
   'RUNLEVEL=3',
   'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/puppetlabs/bin',
   'HOME=/root/',
   'TERM=xterm'
  ],

  }
  docker::run { 'db.puppet.vm':
  image => 'puppet/puppet-agent',
  net => 'dockeragent-net',
  command => '/bin/sh -c "while true; do echo hello world; sleep 1; done"',
  env =>  [
    'RUNLEVEL=3',
    'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/puppetlabs/bin',
    'HOME=/root/',
    'TERM=xterm'
   ],

   }
}
  
