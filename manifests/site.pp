
#client only node
node 'ip-172-31-18-180.ap-southeast-1.compute.internal'{

 
  include mcollective
  
  file { '/usr/local/bin/mco':
  
  ensure => link,
  target => '/opt/puppetlabs/bin/mco',
  }
  


}


#server (All other nodes other than clients"
node 'ip-172-31-26-155.ap-southeast-1.compute.internal' {
 include mcollective
 
 
 
}

#puppet server

node "ip-172-31-18-86.ap-southeast-1.compute.internal" {
  class{"nats": }
}

