sudo apt-get update
sudo apt-get -y install python3-pip ipython3 ipython3-notebook # lidbhdf5-dev cython
sudo -H pip3 install --upgrade pip
sudo -H pip3 install --upgrade ipython
sudo -H pip3 install jupyter pandas numpy scipy scikit-learn matplotlib h5py
sudo -H pip3 install keras tensorflow

####
## Start Jupyter Notebook

jupyter notebook --generate-config
# set these two settings:
# c.NotebookApp.allow_origin = '*' #allow all origins
# c.NotebookApp.ip = '0.0.0.0' # listen on all IPs

cd /mnt; nohup jupyter notebook --no-browser --port 8888 &
