# AWS-scripts

Scripts to quickly set up an AWS instance. Two variants, one that creates a Docker container via `docker-compose`, and one that sets everything up natively on the instance.

/* Although [this post](https://hackernoon.com/keras-with-gpu-on-amazon-ec2-a-step-by-step-instruction-4f90364e49ac) describes a much easier variant of what I figured out here. */

/* If you want to run a machine with GPU support you have to request a limit increase on these instances (e.g. a p2.xlarge) because by default, you're not allowed to use one (y tho) */

# Preliminary steps

1. Create an EBS volume of at least 100GB
1. Create an Ubuntu EC2 instance.
    1. If you want GPU, get a p2.xlarge (you must first request a limit increase with the support, this takes about 2 days). Make the HDD space have 16GB, the CUDA stuff is quite big.
    2. If CPU is good enough, get a t2.large, for 10ct/hr. The free tier's RAM won't suffice.
	3. Make sure you choose the same availability zone (e.g. us-east-2c and us-east-2c. If it's 2a and 2c, they can't communicate!)
1. Stop the instance.
1. [Attach the EBS volume to it](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html). Oddly, the AWS console will show it as being attached to e.g. /dev/sdf, but inside the device will really be /dev/xvdf.
2. [Open port 8888](https://stackoverflow.com/questions/17161345/how-to-open-a-web-server-port-on-ec2-instance) on it to expose Jupyter Notebook. Make sure you `Add Rule`, not `Edit` the existing SSH tunnel.
3. Download your .pem key file
4. Make it private: `chmod 400 MyFirstTestMachine.pem`
1. (optional) Add the AWS hostname to your `~/.ssh/config` and shortcut it to `aws`
5. Connect to your instance: `ssh -i "MyFirstTestMachine.pem" ubuntu@ec2-18-218-63-138.us-east-2.compute.amazonaws.com` (or use the shorthand `aws`)
1. In your EC2 instance, format the EBS volume: `mkfs.ext4 /dev/xvdf` (if you want to be thorough, `fdisk` it and create a partition /dev/xvdf1)
1. edit /etc/fstab and add this line (double check that the EBS volume's device name is correct):
    `/dev/xvdf /mnt ext4 defaults 0 0"`
1. Do `mount -a`
2. Upload your local data to the EBS volume. From your local machine, do this:
    `cd AWS-key-dir`
    `scp -r -i MyFirstTestMachine.pem /home/alexx/github/kaggle/jigsaw-toxic-comment-classification-challenge/work/data ubuntu@ec2-18-216-16-165.us-east-2.compute.amazonaws.com:/mnt/`
1. Git is already installed on the EC2 clusters. So just go:
    `git clone https://github.com/AlexEngelhardt/AWS-scripts.git`

Then, use the .sh scripts from this repository to quickly install the necessary software for a specific taks and set up your environment.

# Native

Just execute the preliminary steps above and then run `native-setup-cpu.sh` to host a Jupyter Notebook.

If you want GPU support, then go through  `native-setup-gpu.sh` script.

# Docker

Run the commands in `docker-setup.sh` to prepare your machine for running a Docker container.

Then, launch the container for the Jupyter Notebook by issuing 'make' (which in turn calls `docker-compose`)

# Finally

Point your browser to `http://<your-host-name>.compute.amazonaws.com:8888` (replace your hostname obv) and pray.

You'll need to issue a last `jupyter notebook list`. If you used Docker, get the container ID by `sudo docker container ls` and run `sudo docker container exec <container-id> jupyter notebook list` instead.

Paste the token into the web browser and off you go!


