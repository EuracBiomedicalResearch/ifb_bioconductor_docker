# Docker containers for the Institute for Biomedicine

[![License: CC BY-NC 4.0](https://img.shields.io/badge/License-CC%20BY--NC%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc/4.0/)
![docker pulls](https://img.shields.io/docker/pulls/jorainer/ifb_bioconductor_docker)
[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/jorainer/ifb_bioconductor_docker?label=docker%20image)](https://hub.docker.com/repository/docker/jorainer/ifb_bioconductor_docker)

**Last updated**: 2022-09-19


This repository defines docker containers extending the [docker containers from
Bioconductor](https://github.com/Bioconductor/bioconductor_docker) with
additional software needed at the Institute for Biomedicine from Eurac Research.

Each branch is *linked* to a different Bioconductor (docker) version, with the
*main* branch always linking to the current developmental Bioconductor version
and respective docker image with tag *devel*.


## Additional software

The docker container builds on the official Bioconductor docker container adding
the following software:

- [SOLAR-Eclipse](http://solar-eclipse-genetics.org/downloads.html) version
  8.5.1 (static).
- A set of perl libraries required by
  [Haplopainter](http://haplopainter.sourceforge.net/) to enable usage of this
  software for pedigree plotting using the `FamAgg` Bioconductor package.


## Build and test the docker images locally

To build the docker image locally run

```
docker build . --pull -t jorainer/ifb_bioconductor_docker:devel
```

The docker can then be started with (which will open an interactive shell 
within the running container).

```
docker run -it --user rstudio jorainer/ifb_bioconductor_docker:devel /bin/bash
```
