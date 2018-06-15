#!/bin/bash

EXIT=0
export ANSIBLE_FORCE_COLOR=true
ansible-playbook -i inventory ./deploy_hubs.yml <<< 'ansible playbook' || EXIT=$?
sleep 10
ansible-playbook -i inventory ./deploy_spokes.yml <<< 'ansible playbook' || EXIT=$?
sleep 10
ansible-playbook -i inventory ./ping_test.yml <<< 'ping test' || EXIT=$?
echo $EXIT
exit $EXIT