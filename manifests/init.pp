class ibgp (
  Integer $local_as,
  String  $source,
  String  $source6,
) inherits ibgp::params {

  validate_ip_address($source)
  validate_ip_address($source6)

  contain ibgp::config

  class { 'ibgp::config': }

}
