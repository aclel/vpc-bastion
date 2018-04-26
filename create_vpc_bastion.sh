#!/bin/bash

KEY_NAME=DefaultKey

# Create SSH key pair to access Bastion during provisioning
# aws ec2 create-key-pair --key-name DefaultKey --query 'KeyMaterial' --output text > "${KEY_NAME}.pem"
# chmod 400 "${KEY_NAME}.pem"

# Create VPC and Bastion
aws cloudformation create-stack --stack-name VPC-Bastion \
    --template-url https://s3.amazonaws.com/qherb-cloudformation-templates/vpc-bastion.cfn.yml \
    --parameters \
    ParameterKey=AvailabilityZone1,ParameterValue=ap-southeast-2a \
    ParameterKey=AvailabilityZone2,ParameterValue=ap-southeast-2b \
    ParameterKey=KeyName,ParameterValue=$KEY_NAME \
    ParameterKey=LogRetentionInDays,ParameterValue=1 \
    --capabilities CAPABILITY_IAM

# Manually add existing RDS instance to VPC
