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
file { [ 
    "$www_dir/dev-data", "$www_dir/prod-data",
    "$www_dir/dev-main", "$www_dir/prod-main",
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
# TODO clone each site from git
# TODO run each site's setup script (which creates a venv and installs things)
# TODO download secrets.py (which has API secrets / password hashes / etc)

# Configure the system
#
# TODO download and install the varnish configuration
# TODO download and install init.d scripts for each www site

# Bring up the sites
#
# TODO

