## Docker-Knife 

[![Build](https://github.com/johnbarney/docker-knife/actions/workflows/build-and-push.yml/badge.svg)](https://github.com/johnbarney/docker-knife/actions/workflows/build-and-push.yml)

[Docker Hub](https://hub.docker.com/r/johnbarney/docker-knife/)

This project is in response to not wanting a flood of gems or the omnibus installer package installed on my CI system. This is somewhat mitigated with the release of Chef 17 but the docker use case still makes sense.

Example usage:

`docker run --rm -v $(pwd):/knife johnbarney/docker-knife:16 bootstrap node07`

If you are in your chef-repo, this will mount your chef-repo as the working directory. This assumes your knife.rb file is within your chef-repo folder and not in /etc/chef or some other location.

## Change Log

11-5-2021
* Update Dockerfiles with tech I've learned since I first wrote them
* Log into DockerHub before build to prevent pull rate limiting
* Removed support for EOL knife versions (12-14)
* Added support for Knife 17+
