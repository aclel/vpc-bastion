#!/bin/bash

# Create S3 buckets
aws cloudformation create-stack --stack-name S3 \
    --template-body file:///Users/andrew/projects/qherb-re/cloudformation/s3.cfn.yml
