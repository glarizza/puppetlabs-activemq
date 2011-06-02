# Class: activemq::params
#
#   This class provides parameters for all other classes in the activemq
#   module.  This class should be inherited.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class mcollective::params {

  $config_path                = '/etc/activemq/activemq.xml'
  $stomp_user                 = 'mcollective'
  $stomp_passwd               = 'marionette'
  $stomp_port                 = '61613'
  $stomp_admin_user           = 'admin'
  $stomp_admin_passwd         = 'admin'
  
  $amq_user                   = 'activemq'
  $amq_group                  = 'activemq'
  $amq_uid                    = '92'
  $amq_gid                    = '92'

  $amq_version = $operatingsystem ? {
    default                   => 'present',
  }

  $amq_init_configfile = $operatingsystem ? {
      /(?i-mx:ubuntu|debian)/ => '/etc/default/activemq',
      default                 => '/etc/sysconfig/activemq',
  }

  $amq_pidfile = $operatingsystem ? {
    default => '/var/run/activemq/activemq.pid',
  }

  $amq_datadir = $operatingsystem ? {
    default => '/var/lib/activemq',
  }

  $amq_logdir = $operatingsystem ? {
    default => '/var/log/activemq',
  }

  $amq_service_name = $operatingsystem ? {
    /(?i-mx:darwin)/            => 'com.puppetlabs.activemq',
    default                     => 'activemq',
  }

  $amq_pkg_name = $operatingsystem ? {
    /(?i-mx:darwin)/            => 'activemq-5.5.0-2.dmg',
    default                     => 'activemq'
  }
  
}

