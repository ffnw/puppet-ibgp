class ibgp (
  Integer $local_as,
  String  $source,
  String  $source6,
) inherits ibgp::params {

  validate_ip_address($source)
  validate_ip_address($source6)

  class { 'ibgp::config': }

  contain ibgp::config

  create_resources('ibgp::peer', hiera('ibgp::peer', {}))

}
