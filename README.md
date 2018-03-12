# AWS-scripts

scripts to quickly set up an AWS instance

1. Create an Ubuntu EC2 instance
2. Open port 8888 on it to expose Jupyter Notebook ([see here](https://stackoverflow.com/questions/17161345/how-to-open-a-web-server-port-on-ec2-instance) for a HowTo)
3. Download your .pem key file
4. Make it private: `chmod 400 MyFirstTestMachine.pem`
5. Connect to your instance: `ssh -i "MyFirstTestMachine.pem" ubuntu@ec2-18-218-63-138.us-east-2.compute.amazonaws.com`

Then, use the .sh scripts here to quickly install the necessary software for a specific taks and set up your environment.

Git is already installed on the EC2 clusters. So just go:

    git clone https://github.com/AlexEngelhardt/AWS-scripts.git
