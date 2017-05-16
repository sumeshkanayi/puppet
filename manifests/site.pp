
node 'ip-172-31-22-77.ap-southeast-1.compute.internal'{

 
  include mcollective
  
   file{ '/tmp/test.txt': {
 
 ensure => present,
 content => "Atlast"
 
 }


}


node 'ip-172-31-18-164.ap-southeast-1.compute.internal' {
 include mcollective
 
 file{ '/tmp/test.txt': {
 
 ensure => present,
 content => "Atlast"
 
 }
 
 
}


node "ip-172-31-21-213.ap-southeast-1.compute.internal" {
  class{"nats": }
}

