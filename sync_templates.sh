#!/bin/bash

aws s3 sync ./cloudformation s3://qherb-cloudformation-templates --delete