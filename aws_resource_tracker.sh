#!/bin/bash

################################################
# Author: Samuel Dressman
# Date: 26/12/2024
#
# Version: v1
#
# This script will report the AWS resource usage
###############################################

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

set -x
set -e

# Listing the s3 buckets
echo "Print the list of s3 buckets"
aws s3 ls > resourceTracker

# listing the EC2 instances
echo "Print list of EC2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' > resourceTracker

# Listing the AWS Lambda Functions
echo "Print list of lambda functions"
aws lambda list-functions > resourceTracker

# Listing the IAM users functions
echo "Print list of IAM users"
aws iam list-users > resourceTracker

