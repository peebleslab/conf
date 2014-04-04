# peebleslab.pp
# Main puppet manifest for deploying a new PeeblesLab host machine.
#

# General configuration options
#
$www_dir    = '/www'
$www_user   = 'plab'
$www_group  = 'plab'

# Create the www user, who will be responsbile for serving all site content.
# For security reasons, this user will have restricted access to the machine
# and the sites it runs.
# 
user { $www_user:
    ensure  => present,
    gid     => $www_group,
    home    => $www_dir,
    shell   => '/bin/bash',

    require => Group[$www_group]
}

group { $www_group:
    ensure => present
}

# Install required packages
#
package { 'python':
    ensure => present
}

package { 'python-pip':
    ensure  => present,
    require => Package['python']
}

package { 'virtualenv':
    ensure   => present,
    provider => 'pip',
    require  => Package['python-pip']
}

package { 'varnish':
    ensure => present
}

# Create the www site hierarchy
#
file { [ "$www_dir",
    "$www_dir/dev-site", "$www_dir/prod-site",
    "$www_dir/dev-store", "$www_dir/prod-store",
    "$www_dir/dev-admin", "$www_dir/prod-admin",
    "$www_dir/dev-vault", "$www_dir/prod-vault"
    ]:

    ensure  => directory,
    owner   => $www_user,
    group   => 'root',
    mode    => 2575,

    require => User[$www_user]
}

# Populate the sites
#
vcsrepo { 'dev-site':
    path     => "$www_dir/dev-site",
    ensure   => latest,

    owner    => $www_user,
    group    => 'root',

    provider => git,
    source   => 'https://github.com/peebleslab/site.git',
    revision => 'master',

    require  => File["$www_dir/dev-site"]
}

exec { 'serve-dev-site':
    command   => "$www_dir/dev-site/serve",
    subscribe => Vcsrepo['dev-site']
}

vcsrepo { 'prod-site':
    path     => "$www_dir/prod-site",
    ensure   => latest,

    owner    => $www_user,
    group    => 'root',

    provider => git,
    source   => 'https://github.com/peebleslab/site.git',
    revision => 'master',

    require  => File["$www_dir/prod-site"]
}

exec { 'serve-prod-site':
    command   => "$www_dir/prod-site/serve",
    subscribe => Vcsrepo['prod-site']
}

vcsrepo { 'dev-store':
    path     => "$www_dir/dev-store",
    ensure   => latest,

    owner    => $www_user,
    group    => 'root',

    provider => git,
    source   => 'https://github.com/peebleslab/store.git',
    revision => 'master',

    require  => File["$www_dir/dev-store"]
}

exec { 'serve-dev-store':
    command   => "$www_dir/dev-store/serve",
    subscribe => Vcsrepo['dev-store']
}

vcsrepo { 'prod-store':
    path     => "$www_dir/prod-store",
    ensure   => latest,

    owner    => $www_user,
    group    => 'root',

    provider => git,
    source   => 'https://github.com/peebleslab/store.git',
    revision => 'master',

    require  => File["$www_dir/prod-store"]
}

exec { 'serve-prod-store':
    command   => "$www_dir/prod-store/serve",
    subscribe => Vcsrepo['prod-store']
}

vcsrepo { 'dev-admin':
    path     => "$www_dir/dev-admin",
    ensure   => latest,

    owner    => $www_user,
    group    => 'root',

    provider => git,
    source   => 'https://github.com/peebleslab/admin.git',
    revision => 'master',

    require  => File["$www_dir/dev-admin"]
}

exec { 'serve-dev-admin':
    command   => "$www_dir/dev-admin/serve",
    subscribe => Vcsrepo['dev-admin']
}

vcsrepo { 'prod-admin':
    path     => "$www_dir/prod-admin",
    ensure   => latest,

    owner    => $www_user,
    group    => 'root',

    provider => git,
    source   => 'https://github.com/peebleslab/admin.git',
    revision => 'master',

    require  => File["$www_dir/prod-admin"]
}

exec { 'serve-prod-admin':
    command   => "$www_dir/prod-admin/serve",
    subscribe => Vcsrepo['prod-admin']
}

vcsrepo { 'dev-vault':
    path     => "$www_dir/dev-vault",
    ensure   => latest,

    owner    => $www_user,
    group    => 'root',

    provider => git,
    source   => 'https://github.com/peebleslab/vault.git',
    revision => 'master',

    require  => File["$www_dir/dev-vault"]
}

exec { 'serve-dev-vault':
    command   => "$www_dir/dev-vault/serve",
    subscribe => Vcsrepo['dev-vault']
}

vcsrepo { 'prod-vault':
    path     => "$www_dir/prod-vault",
    ensure   => latest,

    owner    => $www_user,
    group    => 'root',

    provider => git,
    source   => 'https://github.com/peebleslab/vault.git',
    revision => 'master',

    require  => File["$www_dir/prod-vault"]
}

exec { 'serve-prod-vault':
    command   => "$www_dir/prod-vault/serve",
    subscribe => Vcsrepo['prod-vault']
}

# Configure the system
#
#file { "$www_dir/peebleslab.vcl":
#
#    ensure  => present,
#    source  => "peebleslab.vcl",
#
#    owner   => $www_user,
#    group   => 'root',
#    mode    => 0575,
#
#    require => File[$www_dir]
#}

# TODO we can't use relative URLs above. Try linking to raw file on github

# TODO read about varnish and write the config file :)
# TODO copy init.d scripts out of this repo

# Bring up the sites
#
# TODO

