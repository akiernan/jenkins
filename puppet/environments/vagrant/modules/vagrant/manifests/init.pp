class vagrant {
  $packages = lookup('packages', Array[String], 'unique', [])
  package { $packages:
    ensure => present
  }
}
