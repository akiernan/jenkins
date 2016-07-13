class vagrant {
  include apt

  Class['apt::update'] -> Package <| provider == 'apt' |>


  $packages = lookup('packages', Array[String], 'unique', [])


  package { $packages:
    ensure => present
  }
}
