#!/bin/bash

echo "**********************************************"
echo "********** Cloning Github ********************"
echo "**********************************************"

cd ~/Github
git clone https://github.com/tmichett/AAP2_Controller_Demo.git


echo "**********************************************"
echo "***** Creating Controller Resources **********"
echo "**********************************************"

cd /home/student/Github/DO467_Notes/Demos/CH4

ansible-galaxy collection install -r collections/requirements.yml -p collections/

ansible-playbook Create_CH4_Project.yml
ansible-playbook Create_CH4_Job_Template.yml
