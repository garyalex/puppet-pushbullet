# pushbullet

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with pushbullet](#setup)
    * [What pushbullet affects](#what-pushbullet-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with pushbullet](#beginning-with-pushbullet)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

- Puppet module to install [pushbullet-bash](https://github.com/Red5d/pushbullet-bash) plus my own wrapper
- Send push notifications to your phone/browser using [PushBullet](https://www.pushbullet.com/) from your server
    - Perfect for monitoring things
    - Can send files and links as well 
- Tested on Redhat / CentOS 6 

## Module Description

Using just bash and curl, and not requiring any fancy dependencies, pushbullet-bash can send anything
from your server to your phone or web browser via PushBullet. 

This makes monitoring and reporting easy on your server, as long as you have internet access.
Proxy support via curl works as well.

## Setup

- puppet module install garyalex-pushbullet

### What pushbullet affects

* installs a clone of the repo into /usr/local/
* Symlinks to the scripts are put into /usr/local/bin
* curlrc and pushbullet config are set for root user

### Setup Requirements **OPTIONAL**

- Depends on [puppetlabs-vcsrepo](https://forge.puppetlabs.com/puppetlabs/vcsrepo) 
- Will install curl and git dependencies

### Beginning with pushbullet

- add module as above
- get an apikey from [pushbullet.com](http://www.pushbullet.com)
- set the apikey parameter when calling the module 

## Usage



## Development

- Let me know if you want to contribute

