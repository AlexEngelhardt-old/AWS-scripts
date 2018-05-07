# Add RStudio to get R 3.4.0 instead of Xenial's 3.2.0
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'

sudo apt-get update
sudo apt-get -y install r-base libxml2-dev libcurl4-openssl-dev libssl-dev

sudo R -e "install.packages(c('tidyverse', 'xgboost', 'mlr'), repos='http://cran.rstudio.com')"
