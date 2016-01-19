#!/bin/bash

set -e
function finish() {
    echo -e "\033[31mBuild failed, cleanup\e[0m\n- Stop vagrant"
    cleanup
    echo -e "\n\033[31mBuild NOT successfull\e[0m"
    exit $1
}

function cleanup() {
   vagrant destroy -f
}

trap finish EXIT SIGHUP SIGINT SIGTERM

cd tests


cp ../ansible.cfg.dist ansible.cfg
cp ../Vagrantfile.dist Vagrantfile
mkdir -p virtualization/drifter
cp  ../Vagrantfile virtualization/drifter/
cp  -r ../provisioning virtualization/drifter/


ln -s ../playbooks/debian-php5.6-parameters.yml playbooks/parameters.yml 
export VIRTUALIZATION_PARAMETERS_FILE=playbooks/debian-php5.6-parameters.yml

export VAGRANT_DEFAULT_PROVIDER=$1


vagrant destroy -f
vagrant up
vagrant ssh -c "php -v"

trap - EXIT SIGHUP SIGINT SIGTERM

cleanup

if [[ -z $GITLAB_CI ]]; then
    echo -e "\n\e[32mBuild successful\e[0m"
fi
