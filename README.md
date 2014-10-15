# packages

This repository holds various scripts, and Makefiles, for building DEB
packages used by FR8nex; you can think of it as a glorified ports tree,
that produces DEB packages.

## The setup

There is a `Vagrantfile` provided in this repository, and it is highly
recommended you build all of this stuff in a Vagrant box, so as you don't
pollute your local system.

Also, should you desire to provision the Vagrant box (which I highly recommend
you do), you will need to have [Ansible](http://ansible.com) installed.
Supplying you are running on a Mac, the easiest way to install Ansible, is
through [Homebrew](http://brew.sh):

	$ brew install ansible

When you provision the Vagrant box, it will install all of the required
system packages, and helper scripts (which are coincidentally Ruby gems), so
when you run `vagrant ssh` the first time, you will have an environment that is
ready to build!

## Building packages

Building packages is done almost completely through `make`. For example, if
you want to build all of the nsq packages, you can run the following command
from the `/vagrant` directory:

	$ make -C nsq clean all

Once `make` is finished, there will be `.deb` packages littered about the `nsq`
directory.

## Notes about packages

*	There is no restriction on how many packages can be built from a
	directory. The `Makefile` in the `nsq` directory, for example,
	currently creates several packages: nsqd, nsqlookupd, nsqadmin, and
	nsq-utils.
*	You should always provide `clean` and `all` targets in your `Makefile`.
	`all` should be the only target you need to invoke to actually build
	any packages, and `clean` should clean everything up, so that it looks
	like nothing has ever happened.

Aside from those points, you can build the packages however you like, even if
your `Makefile` just calls a slew of scripts written in another language.

## Uploading to S3

Some of the Makefiles expose an `upload-to-s3` target, which uses
[deb-s3](https://github.com/krobertson/deb-s3) to create an apt-friendly
repository.

> `apt` is the package manager used by Debian-based distributions, like
> Ubuntu.

One convention used, is that you must define three environment variables,
before calling the `upload-to-s3`:

*	`S3_BUCKET`
	
	The name of the Amazon AWS S3 bucket to upload the resulting .deb
	packages to.
*	`AWS_ACCESS_KEY_ID`
	
	Your AWS access key.
*	`AWS_SECRET_ACCESS_KEY`
	
	Your AWS secret key.

To set these in your environment, you can either add the following lines to
the `/home/vagrant/.bashrc` file, or just run them in the shell (while logged
into the Vagrant box):

	export S3_BUCKET=fr8deb
	export AWS_ACCESS_KEY_ID=...
	export AWS_SECRET_ACCESS_KEY=...

