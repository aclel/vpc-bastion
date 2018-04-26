#!/bin/bash

KEY_NAME=DefaultKey2
VPC_STACK_NAME=VPC
BASTION_STACK_NAME=Bastion

# Create SSH key pair to access Bastion during provisioning
aws ec2 create-key-pair --key-name $KEY_NAME --query 'KeyMaterial' --output text > default_key.pem
chmod 400 default_key.pem

# Create VPC stack
aws cloudformation create-stack --stack-name $VPC_STACK_NAME \
    --template-body file:///Users/andrew/projects/qherb-re/cloudformation/vpc.cfn.yml \
    ParameterKey=AvailabilityZone1,ParameterValue=ap-southeast-2a \
    ParameterKey=AvailabilityZone2,ParameterValue=ap-southeast-2b

# Create Bastion stack
aws cloudformation create-stack --stack-name $BASTION_STACK_NAME \
    --capabilities CAPABILITY_IAM \
    --template-body file:///Users/andrew/projects/qherb-re/cloudformation/bastion.cfn.yml \
    --parameters \
    ParameterKey=NetworkStackName,ParameterValue=$VPC_STACK_NAME \
    ParameterKey=KeyName,ParameterValue=$KEY_NAME \
    ParameterKey=LogRetentionInDays,ParameterValue=1

# Manually add existing RDS instance to VPC
