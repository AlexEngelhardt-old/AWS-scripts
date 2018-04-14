sudo apt-get update
sudo apt-get -y install r-base

cat > rpackages.R <<EOF
install.packages("tidyverse", repos = "http://cran.rstudio.com")
EOF

sudo R CMD BATCH rpackages.R
