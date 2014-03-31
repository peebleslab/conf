# peebleslab.pp
# Main puppet manifest for deploying a new PeeblesLab host machine.
#

# General configuration options
$www_dir    = '/www'
$www_user   = 'plab'
$www_group  = 'plab'

# Create the www directory, which will contain all site content

# TODO create the folder
# TODO set the owner to www, with chmod u=rx
# TODO set the group to root, with chmod u=rwx
# TODO set chmod o=rx
# TODO set the sticky bit so subdirs get the same perms by default

# Create the www user, who will be responsbile for serving all site content.
# For security reasons, this user will have restricted access to the machine
# and the sites it runs.

# TODO create the user
# TODO add to www group
# TODO remove all groups except www
# TODO chroot the user to the www dir

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

