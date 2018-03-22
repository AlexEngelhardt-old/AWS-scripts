sudo apt-get update
sudo apt-get -y install python3-pip ipython3 ipython3-notebook # lidbhdf5-dev cython
sudo -H pip3 install --upgrade pip
sudo -H pip3 install --upgrade ipython
sudo -H pip3 install jupyter pandas numpy scipy scikit-learn matplotlib h5py
sudo -H pip3 install keras tensorflow-gpu  # GPU-specific tensorflow

####
## Extra stuff if you want to enable GPU
## https://github.com/tensorflow/tensorflow/issues/15604

## TODO this doesn't work yet.

wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb

sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo apt-key adv --fetch-keys \
     http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda-9-0


####
## Start Jupyter Notebook

jupyter notebook --generate-config
# set these two settings:
# c.NotebookApp.allow_origin = '*' #allow all origins
# c.NotebookApp.ip = '0.0.0.0' # listen on all IPs

cd /mnt; nohup jupyter notebook --no-browser --port 8888 &
