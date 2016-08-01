class vagrant::docker {
  class { 'docker':
    docker_users => ['vagrant', 'jenkins'],
  }
}
