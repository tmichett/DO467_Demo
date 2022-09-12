#!/bin/bash

echo "**********************************************"
echo "***** Login to Automation Hub ****************"
echo "**********************************************"
podman login -u admin -p redhat hub.lab.example.com

echo "**********************************************"
echo "***** Pull Execution Environment**************"
echo "**********************************************"
podman pull hub.lab.example.com/ee-supported-rhel8:latest
