# puppet-ibgp

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with ibgp](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ibgp](#beginning-with-ibgp)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Manages iBGP route exchange.

To do so this module creates bird configuration files.

## Setup

### Setup Requirements

* puppet modules
  * ffnw-bird

### Beginning with ibgp

```puppet
class { '::ibgp':
  local_as => 65536,
  source   => '1.2.3.4',
  source6  => 'fc00::1',
}
```

## Usage

```puppet
class { '::ibgp':
  local_as => 65536,
  source   => '1.2.3.4',
  source6  => 'fc00::1',
}

ibgp::peer { 'gw02':
  neighbor  => '1.2.3.5',
  neighbor6 => 'fc00::2',
}
```

## Reference

* class ibgp
  * $local\_as
  * $source
  * $source6

* define ibgp::peer
  * $neighbor
  * $neighbor6

## Limitations

### OS compatibility
* Debian 8

## Development

### How to contribute
Fork the project, work on it and submit pull requests, please.

