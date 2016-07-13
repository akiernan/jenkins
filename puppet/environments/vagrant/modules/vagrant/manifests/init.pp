class vagrant {
  include apt

  Class['apt::update'] -> Package <| provider == 'apt' |>
  Apt::Source <| |> ~> Class['apt::update'] -> Package <| |>

  $packages = lookup('packages', Array[String], 'unique', [])
  package { $packages:
    ensure => present
  }
}
