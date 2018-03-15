# AWS-scripts

scripts to quickly set up an AWS instance

1. Create an EBS volume of at least 100GB
1. Create an Ubuntu EC2 instance (t2.large, for 10ct/hr. The free tier's RAM won't suffice.). Make sure you choose the same availability zone (e.g. us-east-2c and us-east-2c. If it's 2a and 2c, they can't communicate!)
1. Stop the instance.
1. [Attach the EBS volume to it](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html). Oddly, the AWS console will show it as being attached to e.g. /dev/sdf, but inside the device will really be /dev/xvdf.
2. [Open port 8888](https://stackoverflow.com/questions/17161345/how-to-open-a-web-server-port-on-ec2-instance) on it to expose Jupyter Notebook. Make sure you `Add Rule`, not `Edit` the existing SSH tunnel.
3. Download your .pem key file
4. Make it private: `chmod 400 MyFirstTestMachine.pem`
1. (optional) Add the AWS hostname to your `~/.ssh/config` and shortcut it to `aws`
5. Connect to your instance: `ssh -i "MyFirstTestMachine.pem" ubuntu@ec2-18-218-63-138.us-east-2.compute.amazonaws.com` (or use the shorthand `aws`)
1. In your EC2 instance, format the EBS volume: `mkfs.ext4 /dev/xvdf` (if you want to be thorough, `fdisk` it and create a partition /dev/xvdf1)
1. edit /etc/fstab and add this line:

    `/dev/xvdf /mnt ext4 defaults 0 0"`

  Double check that the EBS volume's device name is correct
1. Do `mount -a`
2. Upload your local data to the EBS volume:
    `cd AWS-key-dir`
    `scp -r -i MyFirstTestMachine.pem /home/alexx/github/kaggle/jigsaw-toxic-comment-classification-challenge/work/data ubuntu@ec2-18-216-16-165.us-east-2.compute.amazonaws.com:/mnt/`

1. Git is already installed on the EC2 clusters. So just go:
    `git clone https://github.com/AlexEngelhardt/AWS-scripts.git`

Then, use the .sh scripts from this repository to quickly install the necessary software for a specific taks and set up your environment.

Finally, launch a docker container for the Jupyter Notebook by issuing 'make' (which in turn calls `docker-compose`)

### Finally:

Point your browser to `http://ec2-18-219-46-100.us-east-2.compute.amazonaws.com:8888` (replace your hostname obv) and pray.

You'll need to issue a last `sudo docker container exec c5fc jupyter notebook list` (get the container ID by `sudo docker container ls`. Paste the token into the web browser and off you go!
