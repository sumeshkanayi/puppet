# Class: activemq
# ===========================
#
# Full description of class activemq here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'activemq':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class activemq {

  $packageList=["default-jdk","activemq"]
  $packageList.each|$packageName|{

  package { "$packageName":

  ensure => present,

  }


  }

  file { '/tmp/apache-activemq-5.14.5-bin.tar.gz':

source => 'http://archive.apache.org/dist/activemq/5.14.5/apache-activemq-5.14.5-bin.tar.gz',
    ensure => present,
  }
  exec { 'extract':

    command => 'tar -xvzf /tmp/apache-activemq-5.14.5-bin.tar.gz ',
    cwd => '/tmp',
    path => ['/bin']
  }


file{ '/usr/share/activemq/lib/optional/activemq-stomp-5.14.5.jar':

  ensure => present,
  source => '/tmp/apache-activemq-5.14.5/lib/optional/activemq-stomp-5.14.5.jar'



}

  file {'/etc/activemq/instances-enabled/main':

    target => '/etc/activemq/instances-available/main',
    ensure => link,

  }


  file { '/etc/activemq/instances-available/main/activemq.xml':

    ensure => present,
    source =>"puppet:///modules/activemq/activemq.xml"


  }

  service { 'activemq':

    ensure => running,

  }



}
