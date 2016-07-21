class vagrant::jenkins {
  include jenkins

  $jenkins_packages = lookup('jenkins_packages', Array[String], 'unique', [])
  jenkins::plugin { $jenkins_packages:
  }
}
