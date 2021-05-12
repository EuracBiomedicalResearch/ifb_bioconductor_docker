# Docker containers for the Institute for Biomedicine

This repository defines docker containers extending the [docker containers from
Bioconductor](https://github.com/Bioconductor/bioconductor_docker) with
additional software needed at the Institute for Biomedicine from Eurac Research.

## Additional software

The docker container builds on the official Bioconductor docker container adding
the following software:

- [SOLAR-Eclipse](http://solar-eclipse-genetics.org/downloads.html) version
  8.5.1 (static).

## Build and test the docker images locally

To build the docker image locally run

```
docker build . --pull -t ifb_bioconductor_docker:RELEASE_3_12
```

The docker can then be started with

```
docker run -it jorainer/ifb_bioconductor_docker:RELEASE_3_12 /bin/bash
```
