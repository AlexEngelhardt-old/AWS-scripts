# https://aws.amazon.com/blogs/big-data/running-jupyter-notebook-and-jupyterhub-on-amazon-emr/

# (should that fail, this might be an alternative:
#  https://bytes.babbel.com/en/articles/2017-07-04-spark-with-jupyter-inside-vpc.html
# )

aws s3 cp s3://aws-bigdata-blog/artifacts/aws-blog-emr-jupyter/install-jupyter-emr5.sh .
chmod ugo+x ./install-jupyter-emr5.sh
./install-jupyter-emr5.sh --r --toree --ds-packages --user jupyter --password d04kjcd4t --jupyterhub --port 8885 --notebook-dir s3://aifora-jupyter-notebooks --python3
echo "done"
