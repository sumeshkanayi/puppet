node 'ip-172-31-18-63.ap-southeast-1.compute.internal'{

  class { '::mcollective':
    middleware_hosts => [ 'ip-172-31-16-107' ],
    client => true,

  }
}

node 'ip-172-31-16-107.ap-southeast-1.compute.internal'{

  class { 'activemq':



  }
}