# AWS-scripts

scripts to quickly set up an AWS instance

1. Create an Ubuntu EC2 instance. Have it 'stopped' instead of 'running' to attach the volume now:
1. Create an EBS volume of at least 100GB
1. [Attach the EBS volume to it](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html)
3. Download your .pem key file
4. Make it private: `chmod 400 MyFirstTestMachine.pem`
5. Connect to your instance: `ssh -i "MyFirstTestMachine.pem" ubuntu@ec2-18-218-63-138.us-east-2.compute.amazonaws.com`
1. In your EC2 instance, format the EBS volume: `mkfs.ext4 /dev/xvdf` (if you want to be thorough, `fdisk` it and create a partition)
1. edit /etc/fstab and add this line:

    `/dev/xvdf /mnt ext4 defaults 0 0"`

  Double check that the EBS volume's device name is correct
2. [Open port 8888](https://stackoverflow.com/questions/17161345/how-to-open-a-web-server-port-on-ec2-instance) on it to expose Jupyter Notebook 
1. Git is already installed on the EC2 clusters. So just go:
    `git clone https://github.com/AlexEngelhardt/AWS-scripts.git`

Then, use the .sh scripts from this repository to quickly install the necessary software for a specific taks and set up your environment.

