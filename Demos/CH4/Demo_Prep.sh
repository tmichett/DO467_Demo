#!/bin/bash

echo "**********************************************"
echo "********** Cloning Github ********************"
echo "**********************************************"

cd ~/Github
git clone https://github.com/tmichett/AAP2_Controller_Demo.git


echo "**********************************************"
echo "***** Creating Controller Resources **********"
echo "**********************************************"

ansible-playbook Create_CH4_Project.yml
