class packages::package_install($version) {
    package { 'python':
        ensure => $version,
    }
}
