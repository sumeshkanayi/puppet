
#client only node
node 'ip-172-31-31-76.ap-southeast-1.compute.internal'{

 
  include mcollective
  
  file { '/usr/local/bin/mco':
  
  ensure => link,
  target => '/opt/puppetlabs/bin/mco',
  }
  


}


#server (All other nodes other than clients"
node 'ip-172-31-28-99.ap-southeast-1.compute.internal' {
 include mcollective
 file { '/usr/local/bin/mco':
  
  ensure => link,
  target => '/opt/puppetlabs/bin/mco',
  }
 
  file { '/tmp/sia.txt':
  
  ensure => present,
  content => "Hi sia",
  }
 
 
 
}

#puppet server

node "ip-172-31-23-193.ap-southeast-1.compute.internal" {
  class{"nats": }
  file { '/usr/local/bin/mco':
  
  ensure => link,
  target => '/opt/puppetlabs/bin/mco',
  }
}

