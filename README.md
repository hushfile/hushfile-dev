# Hushfile-dev

## About

This is the development environment setup to make it easy to start working on hushfile.
It also contains examples of how you can configure the service to run using different
servers and clients.


## Installing the development environment

Inside a terminal execute the following commands

 1. `git clone git@github.com:hushfile/hushfile-dev.git && cd hushfile-dev && ./setup.py`
 2. `cd vagrant && vagrant up && vagrant ssh`
 3. Start coding


## Developing

When the box starts, there is no running server as the developer needs to decide which server to develop on/against.

Vagrant uses port forwarding. Webaccess is gained through port 8600 and it will take 
nginx is configured to proxy requests locally on port `86`. Access is gained from a browser on the host system through port `8600`. 

That means, the server should be accessible from the host machine at `http://localhost:8600`.
