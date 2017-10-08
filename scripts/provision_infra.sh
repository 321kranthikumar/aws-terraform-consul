#!/bin/sh

# Provision AWS infrastructure

set -e

echo " "
echo "*** Building AWS ADOP infrastructure ***"

terraform remote config \
  -backend=s3 \
  -backend-config="bucket=tf-remote-state-gstafford" \
  -backend-config="key=terraform_adop.tfstate" \
  -backend-config="region=us-east-1"

terraform plan -no-color
terraform apply -no-color

echo " "
echo "*** Building AWS ADOP infrastructure complete ***"
