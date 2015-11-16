class garyalex-pushbullet (
    $gitrepo   = $garyalex-pushbullet::params::gitrepo,
    $apikey    = $garyalex-pushbullet::params::apikey,
    $proxy     = $garyalex-pushbullet::params::proxy,
    $proxyuser = $garyalex-pushbullet::params::proxyuser,
) inherits garyalex-pushbullet::params {

  package { 'curl':
    ensure   => installed,
  }

  vcsrepo { '/usr/local/pushbullet/':
    ensure   => present,
    provider => git,
    source   => $gitrepo,
    revision => 'master',
    require  => Package['git'],
  }

  file { '/usr/local/etc/curlrc':
    ensure  => present,
    content => template('garyalex-pushbullet/curlrc.erb'),
    mode    => 0644,
    require => Package['curl'],
  }

  file { '/root/.config/pushbullet':
    ensure  => present,
    content => template('garyalex-pushbullet/pushbullet.erb'),
    mode    => 0644,
    require => File['/root/.config'],
  }

  file { '/root/.config':
    ensure => directory,
    owner  => root,
    mode   => 755,
    before => File['/root/.config/pushbullet']
  }

  file { '/usr/local/bin/pushbullet':
    ensure  => link,
    mode    => 0755,
    target  => "/usr/local/pushbullet/pushbullet",
    require => vcsrepo['/usr/local/pushbullet'],
  }

  file { '/usr/local/bin/pbwrapper.sh':
    ensure  => link,
    mode    => 0755,
    target  => "/usr/local/pushbullet/pbwrapper.sh",
    require => vcsrepo['/usr/local/pushbullet'],
  }
}

