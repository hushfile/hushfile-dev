# Hushfile-dev

## About

The contents of this repository is for development on hushfile. It's purpose is to allow a uniform development environment for developers. Furthermore, the files can be used as an example on how to configure the service.


## Developing

### Requirements
  * https://vagrantup.com
  * https://virtualbox.org
  * https://ansible.com
  * https://git-scm.com

On Debian/Ubuntu you can use `sudo apt-get install git vagrant virtualbox ansible`.


### Installing the development environment

After the required applications are installed do the following in a terminal

 1. `git clone git@github.com:hushfile/hushfile-dev.git`
 2. `cd hushfile-dev/`
 3. `./setup.sh`
 4. `cd vagrant`
 5. `vagrant up`
 6. `vagrant ssh`
 7. Start coding


### Branching strategy

The project `HEAD` is in the `develop` branch. New features are developed by branching out of develop `git checkout -b feature-branch develop` and merged back into `develop` with github pull requests.

Keep in mind that this applies to each repository seperately.

`develop` is pristine, and changes on the `develop` branch for the server and web-interface are automatically pushed to https://dev.hushfile.it to be tested (***TODO***).
Github pull requests are automatically tested with travis when changes are made to the pull request (***TODO***).

When the `develop` branch is ready for production it is fast forwarded onto branch `master`. This is done manually, and the HEAD is tagged with a version number based on Semantic Versioning 2.0.0 (http://semver.org/)


### Reporting issues

We use the github issue tracker to keep track of issues. Please use the issue tracker in the respective repositories where they apply.


## Contact/Support
The easiest way to contact us is by joining our irc channel #hushfile on irc.freenode.net.
