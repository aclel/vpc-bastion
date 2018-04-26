# VPC and Bastion

This repository contains scripts to provision a VPC and a Bastion host within it.

## Prerequisites

* [aws command line tools](https://aws.amazon.com/cli/)
* Run `aws configure` to set up your AWS credentials

## Setup

```
chmod +x ./*.sh

# Wait for this to complete succesfully before running the next command
./create_s3_buckets.sh

# Wait for this to complete succesfully before running the next command
./sync_templates.sh

./create_vpc_bastion.sh
```

## Connect to Bastion host

```
# Get the elastic ip from the EC2 page in the AWS console
ssh -i DefaultKey.pem ec2-user@<bastion-elasic-ip>
```
