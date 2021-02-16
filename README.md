## docker-knife [![Build Status](https://travis-ci.com/johnbarney/docker-knife.svg?branch=master)](https://travis-ci.com/johnbarney/docker-knife)

[Docker Hub](https://hub.docker.com/r/johnbarney/docker-knife/)

This container is in response to not wanting a flood of gem sets or the omnibus installer package installed on my CI system. It uses Docker which is already in use in my CI system to run knife in a container.

Example usage:

`docker run -v $(pwd):/knife johnbarney/docker-knife:12 bootstrap node07`

If you are in your chef-repo, this will mount your chef-repo as the working directory. This assumes your knife.rb file is within your chef-repo folder and not in /etc/chef or some other location.
