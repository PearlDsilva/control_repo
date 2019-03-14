class packages::package_install($version) {
    package { 'firefox':
        ensure => $version,
    }
}
