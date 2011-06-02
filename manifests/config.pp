# Class: activemq::config
#
#   This class installs the ActiveMQ configuration file.
#
# Parameters:
#
# [*server_config*] - The content of the activemq configuration file.
# [*config_path]    - The path to the activemq configuration file.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class activemq::config (
  $server_config,
  $config_path    = $activemq::params::config_path
) inherits activemq::params {

  validate_re($path, '^/')
  $path_real = $path

  $server_config_real = $server_config
  
  # Resource defaults
  File {
    owner   => 'activemq',
    group   => 'activemq',
    mode    => '0644',
    notify  => Service['activemq'],
    require => Package['activemq'],
  }

  # The configuration file itself.
  file { 'activemq.xml':
    ensure  => file,
    path    => $path_real,
    owner   => '0',
    group   => '0',
    content => $server_config_real,
  }

}
