#!/bin/bash

echo "**********************************************"
echo "******** Launch Job Template *****************"
echo "**********************************************"

curl -X POST --user admin:redhat https://controller.lab.example.com/api/v2/job_templates/"DO467 Demo Job - Testing Inventory"/launch/ -k -s | jq .

