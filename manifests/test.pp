class packages::package_install($version) {
    package { 'mysql-server':
        ensure => $version,
    }
}
