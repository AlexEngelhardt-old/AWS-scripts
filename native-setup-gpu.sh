
# Make sure you have like 16GB hard disk space, CUDA is quite large!

sudo apt-get update
sudo apt-get -y install python3-pip ipython3 ipython3-notebook # lidbhdf5-dev cython

sudo -H pip3 install --upgrade pip

# If the above command returns "locale error: unsupported locale setting", do this and re-run:
# (see: https://stackoverflow.com/questions/14547631/python-locale-error-unsupported-locale-setting )
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales

sudo -H pip3 install jupyter pandas numpy scipy scikit-learn matplotlib h5py
sudo -H pip3 install keras tensorflow-gpu  # GPU-specific tensorflow

####
## Install CUDA and cuDNN if you want to enable GPU
## https://github.com/tensorflow/tensorflow/issues/15604

wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1704/x86_64/cuda-repo-ubuntu1704_9.1.85-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1704/x86_64/7fa2af80.pub
sudo dpkg -i cuda-repo-ubuntu1704_9.1.85-1_amd64.deb
sudo apt-get update
sudo apt-get install devscripts
apt-cache madison cuda
sudo apt-get install cuda=9.0.176-1  # install CUDA 9.0, tensorflow can't work with 9.1 as of now

## The cuDNN stuff must be downloaded locally with a developer account, then uploaded into your mounted data drive.
# Go here: https://developer.nvidia.com/rdp/cudnn-download

sudo dpkg -i /mnt/libcudnn7_7.1.2.21-1+cuda9.0_amd64.deb
sudo dpkg -i /mnt/libcudnn7-dev_7.1.2.21-1+cuda9.0_amd64.deb

####
## Start Jupyter Notebook

jupyter notebook --generate-config
# set these two settings:
# c.NotebookApp.allow_origin = '*' #allow all origins
# c.NotebookApp.ip = '0.0.0.0' # listen on all IPs

cd /mnt; nohup jupyter notebook --no-browser --port 8888 &
