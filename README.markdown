
This repository automates provisioning a bare machine to act as a site server.
We use this mostly to document the server configuration.

To provision a server machine ...

1. Install [git](http://git-scm.com) and [puppet](http://puppetlabs.com).
   For example:

        $ sudo apt-get install git puppet

2. Install the `puppetlabs-vcsrepo` puppet module:

        $ sudo puppet module install puppetlabs-vcsrepo

3. Clone this repository and apply the puppet manifest:

        $ git clone https://github.com/peebleslab/conf
        $ cd conf
        $ sudo puppet apply peebleslab.pp

4. Obtain `plab-secrets.txt` (how? that's a secret ...) and place it in /www.

That's it! Puppet should be able to pilot the provisioning process from there.

NOTE: the setup script clones the sites from source control, using the public
read-only URL (`https://...`). If you need push access for a particular repo.
you'll have to manually change the repo's `origin` to point to the private URL
(`git@github.com/...`).
