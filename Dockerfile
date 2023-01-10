# Base image https://hub.docker.com/u/rocker/
FROM --platform=linux/arm64 r-base:3.6.3

# system libraries of general use
## install debian packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install libxml2-dev \
    libcairo2-dev \
    libsqlite3-dev \
    libmariadbd-dev \
    libpq-dev \
    libssh2-1-dev \
    unixodbc-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libgit2-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libtiff5-dev \
    libsodium-dev
    # libpng-dev \
    # libjpeg-dev \ 
    
## update system libraries
RUN apt-get update && \
    apt-get -y install libcurl4-gnutls-dev && \
    apt-get clean

## install renv & restore packages
RUN Rscript -e 'install.packages("devtools", dependencies = TRUE)'
RUN Rscript -e 'install.packages("usethis", dependencies = TRUE)'
RUN Rscript -e 'install.packages("renv", dependencies = TRUE)'
# RUN Rscript -e 'renv::consent(provided = TRUE)'
