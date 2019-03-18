class profile::agent_nodes{
  include docker
  include dockeragentnew
  dockeragentnew::node {'web.puppet.vm':}
  dockeragentnew::node {'db.puppet.vm':}
}
  
