FROM bioconductor/bioconductor_docker:RELEASE_3_12

LABEL name="jorainer/ifb_bioconductor_docker" \
      url="https://github.com/EuracBiomedicalResearch/ifb_bioconductor_docker" \
      maintainer="johannes.rainer@eurac.edu" \
      description="Bioconductor based docker container with additional sofware." \
      license="Artistic-2.0"

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN apt-get update \
    && apt-get install -y cpanminus

## Install SOLAR
RUN scripts/install-solar.sh

## Install dependencies of Haplopainter
RUN su rstudio scripts/install-perl-modules.sh

