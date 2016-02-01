define ibgp::peer (
  String $neighbor,
  String $neighbor6,
) {

  include ibgp
  include ibgp::params

  validate_ip_address($neighbor)
  validate_ip_address($neighbor6)

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

}
