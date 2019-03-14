class package_install($version) {
    package { 'python':
        ensure => $version,
    }
}
