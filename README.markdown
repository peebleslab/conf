
This repository automates provisioning a bare machine to act as a site server.
We use this mostly to document the server configuration.

To provision a server machine ...

1. Install [git](http://git-scm.com) and [puppet](http://puppetlabs.com).
   For example:

        $ sudo apt-get install git puppet

2. Clone this repository and apply the puppet manifest:

        $ git clone https://github.com/PeeblesLabComics/ServerConf
        $ cd ServerConf
        $ sudo puppet apply peebleslab.pp

3. Obtain `plab-secrets.txt` (how? that's a secret ...) and place it in /www.

That's it! Puppet should be able to pilot the provisioning process from there.
