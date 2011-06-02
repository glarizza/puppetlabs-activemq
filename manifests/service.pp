# Class: activemq::service
#
#   Manage the ActiveMQ Service
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class activemq::service(
  $ensure
) inherits activemq::params {

  # Arrays cannot take anonymous arrays in Puppet 2.6.8
  $v_ensure = [ '^running$', '^stopped$' ]
  validate_re($ensure, $v_ensure)

  $ensure_real = $ensure

  service { 'activemq':
    ensure     => $ensure_real,
    name       => $activemq::params::amq_service_name,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['activemq::packages'],
  }

}
