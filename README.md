# Hushfile-dev

## About

This is the development environment setup to make it easy to start working on hushfile.
It also contains examples of how you can configure the service to run using different
servers and clients.

## Installing dev environment


Inside a terminal execute the following commands

 1. `git clone git@github.com:hushfile/hushfile-dev.git && cd hushfile-dev && ./setup.py`
 2. `cd vagrant && vagrant up && vagrant ssh`
 3. Start coding

## Developing


When the box starts, there is no running server as the developer needs to decide which server to develop on/against.

The servers are configured to use port `86` internally and `8600` externally. Thats means, the server should be accessible from the host machine at `http://localhost:8600`. You can only run
one server at the time

## Starting servers

Here you can find documentation on how to start the different servers.

### hushfile-server/nginx

ssh into the vagrant box and execute `sudo service nginx start`.