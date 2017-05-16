node 'ip-172-31-22-77.ap-southeast-1.compute.internal'{

  class { '::mcollective':
    middleware_hosts => [ 'ip-172-31-16-107' ],
    client => true,

  }
}

node 'ip-172-31-16-107.ap-southeast-1.compute.internal'{

 
  include mcollective


}


node "ip-172-31-21-213.ap-southeast-1.compute.internal" {
  class{"nats": }
}

