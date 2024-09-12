#!/bin/bash -e


######################
### This is to make sure that the terraform files are formatted correctly
#######################
terraform fmt -check *.tf

if [ $? -ne 0 ]; then
    printf "Terraform configuration is formatted incorrectly"
else 
    printf "Terraform configuration successfully formatted\n"
fi

terraform init -reconfigure

