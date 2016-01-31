class ibgp::config inherits ibgp {

  require '::bird'

  file {
    '/etc/bird/bird.conf.d/ibgp/':
      ensure => directory,
      mode   => '0755',
      owner  => root,
      group  => root;
    '/etc/bird/bird.conf.d/ibgp.conf':
      ensure  => file,
      mode    => '0644',
      content => epp('ibgp/bird.epp'),
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
      content => epp('ibgp/bird6.epp'),
      notify  => File['/etc/bird/bird6.conf'];
  }

}
