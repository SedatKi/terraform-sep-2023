#!/bin/bash

# Replace the backend
sed -i g|__env__|$ENV backend.tf

#Execute the commands
terraform init -reconfigure
terraform plan -var-file=$ENV.tfvars
terraform apply -var-file=$ENV.tfvars