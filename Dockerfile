FROM bioconductor/bioconductor_docker:RELEASE_3_12

LABEL name="jorainer/ifb_bioconductor_docker" \
      url="https://github.com/EuracBiomedicalResearch/ifb_bioconductor_docker" \
      maintainer="johannes.rainer@eurac.edu" \
      description="Bioconductor based docker container with additional sofware." \
      license="Artistic-2.0"

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

# ## Setup MySQL and fill with MassBank data
# RUN groupadd -r mysql && useradd -r -g mysql mysql

# RUN apt-get update; \
#     apt-get install -y libgit2-dev; \
#     apt-get install -y mariadb-server; \
#     chown -R mysql:mysql /var/lib/mysql /var/run/mysqld; \
#     chmod 777 /var/run/mysqld; \
#     chmod 777 -R /var/lib/mysql;

# RUN service mysql start; \
#     mysql < scripts/mysql-prepare.sql;

RUN scripts/install-solar.sh

# ## Install the solarius package
# RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install('ugcd/solarius', ask = FALSE)"

# RUN service mysql start && \
#     Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); devtools::install('.', dependencies = TRUE, build_vignettes = TRUE, repos = BiocManager::repositories())"
