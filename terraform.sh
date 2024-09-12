#!/bin/bash -e 



echo "Using the action of: ${actions}"
terraform ${actions}

# if [ "${actions}" == "apply" ]; then
#     'terraform ${actions}'
# else
#     echo "This is ${ENVIRONMENT} environment"
# fi
# terraform ${ action}