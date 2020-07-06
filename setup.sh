#!/bin/bash

set -euxo pipefail

# Install ansible
function install_ansible() {
    # install ansible if not preset
    if ! command -v ansible-playbook &> /dev/null
    then
        pip install ansible
    fi
}

function install_lfs() {
    ansible-playbook install-lfs.yml --extra-vars=hosts=localhost
    git lfs fetch && git lfs checkout
}

function install_dependencies() {
    # Setup the dependencies
    ansible-playbook install-dependencies.yml --extra-vars=hosts=localhost

}

ALLOWED_FUNCTIONS=("install_ansible" "install_lfs" "install_dependencies")
if [ $# -gt 1 ]; then
    echo "Usage: ${0} ( ${ALLOWED_FUNCTIONS[@]} )"
    exit 1
fi 

FUNCTIONS=("${ALLOWED_FUNCTIONS[@]}")
if [ $# -eq 1 ]; then
    
    if ! [[ " ${ALLOWED_FUNCTIONS[@]} " =~ " ${1} " ]]; then
        echo "Allowed values for RESOURCE_TYPE: ${ALLOWED_FUNCTIONS[@]}, Got ${1}"
         exit 1
    fi
    FUNCTIONS=(${1})
fi

for i in ${FUNCTIONS[@]};
do
    ${i}
done


