class ibgp (
  Integer $local_as,
  String  $source,
  String  $source6,
) inherits ibgp::params {

  validate_ip_address($source)
  validate_ip_address($source6)

  @@ibgp::peer { $networking['fqdn']:
    tag       => "AS-${local_as}",
    neighbor  => $source,
    neighbor6 => $source6,
  }
  Ibgp::Peer <<| tag == "AS-${local_as}" and neighbor != $source and neighbor6 != $source6 |>>

}
