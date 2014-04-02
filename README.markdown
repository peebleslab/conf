
This repository automates provisioning a bare machine to act as a site server.
We use this mostly to document the server configuration.

To provision a server machine, first install [puppet](http://puppetlabs.com)
and [git](http://git-scm.com). Then run the following in a terminal:

    $ git clone https://github.com/PeeblesLabComics/ServerConf
    $ cd ServerConf
    $ sudo puppet apply peebleslab.pp

Puppet should be able to pilot the provisioning process from there.
