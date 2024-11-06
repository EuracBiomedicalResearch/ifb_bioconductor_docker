FROM bioconductor/bioconductor_docker:RELEASE_3_20

LABEL name="jorainer/ifb_bioconductor_docker" \
      url="https://github.com/EuracBiomedicalResearch/ifb_bioconductor_docker" \
      maintainer="johannes.rainer@eurac.edu" \
      description="Bioconductor based docker container with additional sofware." \
      license="Artistic-2.0"

WORKDIR /home/rstudio

# COPY --chown=rstudio:rstudio . /home/rstudio/

## Install additional system requirements
RUN apt-get update \
    && apt-get install -y cpanminus

## Install SOLAR
ARG FILE="solar-eclipse-8.5.1-beta-static-linux.zip"
RUN wget -nv "https://www.nitrc.org/frs/download.php/11937/$FILE" \
    && unzip $FILE \
    && rm $FILE \
    && cd solar851 \
    && chmod +x install_solar \
    && ./install_solar /opt/appl/solr/8.5.1 /usr/local/bin solar \
    && rm -Rf solar851
# RUN scripts/install-solar.sh

## Install dependencies of Haplopainter
ARG PLIB="/usr/local/"
RUN cpanm -L $PLIB --notest --reinstall Cairo \
    && cpanm -L $PLIB --reinstall Data::Dumper \
    && cpanm -L $PLIB --reinstall DBI \
    && cpanm -L $PLIB --reinstall File::Basename \
    && cpanm -L $PLIB --reinstall --force File::Spec::Functions \
    && cpanm -L $PLIB --force --notest Gtk2 \
    && cpanm -L $PLIB --reinstall Math::Trig \
    && cpanm -L $PLIB --reinstall Sort::Naturally \
    && cpanm -L $PLIB --reinstall Storable \
    && cpanm -L $PLIB --reinstall --force Tk \
    && echo "PERL5LIB=/usr/local/lib/perl5:$PERL5LIB" >> /usr/local/lib/R/etc/Renviron.site

ENV PERL5LIB="/usr/local/lib/perl5"

## Install tinytex
USER rstudio
RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install('tinytex'); tinytex::install_tinytex()"
