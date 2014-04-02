# peebleslab.pp
# Main puppet manifest for deploying a new PeeblesLab host machine.
#

# General configuration options
#
$www_dir    = '/www'
$www_user   = 'plab'
$www_group  = 'plab'

# Create the www directory, which will contain all site content
#
file { $www_dir:
    ensure  => directory,
    owner   => $www_user,
    group   => 'root',
    mode    => 2575,

    require => User[$www_user]
}

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

# TODO install python
# TODO install pip
# TODO install virtualenv using pip the source
# TODO install varnish

# Create the www site hierarchy

# TODO prod-data / dev-data
# TODO prod-main / dev-main
# TODO prod-store / dev-store
# TODO prod-admin / dev-admin
# TODO prod-vault / dev-vault

# Populate the sites

# TODO clone each site from git
# TODO run each site's setup script (which creates a venv and installs things)
# TODO download secrets.py (which has API secrets / password hashes / etc)

# Configure the system

# TODO download and install the varnish configuration
# TODO download and install init.d scripts for each www site

# Bring up the sites

# TODO

