define ibgp::peer (
  String $transfer,
  String $transfer6,
  String $endpoint,
  String $neighbor,
  String $neighbor6,
) {

  include ibgp
  include ibgp::params

  if !has_ip_address($endpoint) {

    validate_ip_address($transfer)
    validate_ip_address($transfer6)
    validate_ip_address($endpoint)
    validate_ip_address($neighbor)
    validate_ip_address($neighbor6)

    network::inet::tunnel { "gre-ibgp-${title}":
      address  => $transfer,
      mode     => 'gre',
      endpoint => $endpoint,
    }
    network::inet6::static { "gre-ibgp-${title}":
      address => $transfer6,
    }

    file {
      "/etc/bird/bird.conf.d/ibgp/${title}.conf":
        ensure  => file,
        mode    => "0644",
        content => epp("ibgp/peer.epp"),
        notify  => File['/etc/bird/bird.conf.d/ibgp.conf'];
      "/etc/bird/bird6.conf.d/ibgp/${title}.conf":
        ensure  => file,
        mode    => "0644",
        content => epp("ibgp/peer6.epp"),
        notify  => File['/etc/bird/bird6.conf.d/ibgp.conf'];
    }

  } else {
    notice("Skipping iBGP peer. Endpoint ${endpoint} is me.")
  }

}
