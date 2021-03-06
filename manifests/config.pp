class ibgp::config inherits ibgp {

  include router
  include bird

  file {
    '/etc/bird/bird.conf.d/ibgp/':
      ensure => directory,
      mode   => '0755',
      owner  => root,
      group  => root;
    '/etc/bird/bird.conf.d/ibgp.conf':
      ensure  => file,
      mode    => '0644',
      content => epp('ibgp/bird.epp', { source => $source, local_as => $local_as }),
      notify  => File['/etc/bird/bird.conf'];
  }

  file {
    '/etc/bird/bird6.conf.d/ibgp/':
      ensure => directory,
      mode   => '0755',
      owner  => root,
      group  => root;
    '/etc/bird/bird6.conf.d/ibgp.conf':
      ensure  => file,
      mode    => '0644',
      content => epp('ibgp/bird6.epp', { source6 => $source6, local_as => $local_as }),
      notify  => File['/etc/bird/bird6.conf'];
  }

  @@ibgp::peer { $networking['fqdn']:
    tag       => "AS-${local_as}",
    neighbor  => $source,
    neighbor6 => $source6,
  }
  Ibgp::Peer <<| tag == "AS-${local_as}" and neighbor != $source and neighbor6 != $source6 |>>

}
