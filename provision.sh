#!/bin/bash

EXIT=0
export ANSIBLE_FORCE_COLOR=true
ansible-playbook -i inventory ./deploy_hubs.yml <<< 'ansible playbook' || EXIT=$?
sleep 30
ansible-playbook -i inventory ./deploy_spokes.yml <<< 'ansible playbook' || EXIT=$?
#sleep 60
#ansible-playbook ./connection_check.yml <<< 'connectivity check' || EXIT=$?
echo $EXIT
exit $EXIT