#!/bin/bash

echo "**********************************************"
echo "***** Clone Repo from Github *****************"

git config --global credential.helper store
mkdir /tmp/Github
cd /tmp/Github
git clone https://github.com/tmichett/AAP2_Demos.git
cd /tmp/Github/AAP2_Demos


echo "**********************************************"
echo "***** Push Repository to Gitlab ***************"
echo "**********************************************"

echo ""

echo "Creating Gitlab Project"

cd /home/student/Github/DO467_Notes/Demos/Demo_Setup/Gitlab

#Install Pre-Req Python Modules for Gitlab Ansible Modules
sudo python3.6 -m pip install python-gitlab
sudo python3.6 -m pip install requests

#Install Community General Colelction for Ansible to provide Gitlab Ansible Module
ansible-galaxy collection install collections/community-general-5.5.0.tar.gz -p ./collections/

#Run Ansible Playbook with Correct Python Interpreter
ansible-playbook Create_Gitlab_Project.yml  -e 'ansible_python_interpreter=/usr/bin/python3.6'


#echo "Please Setup the Gitlab Repository and Create in Gitlab WebUI"
#echo "URL: https://git.lab.example.com"
#echo "UN/PW: student/Student@123"
#echo "Select *Create Project => Create Blank Project*"
#echo "Project Name: AAP2_Demos"
#echo "Visibility: Public"
#echo "Click *Create Project*"
#echo "Press Enter key to continue (After Repository Setup)"
#while [ true ] ; do
#read -t 3 -n 1
#if [ $? = 0 ] ; then
#break ;
#else
#echo "waiting for the Gitlab Setup"
#fi
#done

echo "Pushing AAP2 Demo to Gitlab Now"

cd /tmp/Github/AAP2_Demos
git remote add gitlab https://git.lab.example.com/student/aap2_demos
git remote set-url origin https://"student:Student@123"@git.lab.example.com/student/aap2_demos
git push -u gitlab main


echo "**********************************************"
echo "***** Pulling Repository from Gitlab *********"
echo "**********************************************"


mkdir /home/student/Gitlab
cd /home/student/Gitlab
git clone https://git.lab.example.com/student/aap2_demos.git 


echo "**********************************************"
echo "******* Inventory Demo Setup Gitlab *   ******"
echo "**********************************************"

mkdir /tmp/CH7
cp -avR /home/student/Github/DO467_Notes/Demos/CH7/Inventory_Project/* /tmp/CH7/
cd ~/Github 
git clone https://git.lab.example.com/student/Inv_Proj
cd Inv_Proj
cp -avR /tmp/CH7/* . 
git add .
git commit -m "Initial Inventory Add"
git push 
