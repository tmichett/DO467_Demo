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
echo "Please Setup the Gitlab Repository and Create in Gitlab"
echo "URL: https://git.lab.example.com"
echo "UN/PW: student/Student@123"
echo "Select *Create Project => Create Blank Project*"
echo "Project Name: AAP2_Demos"
echo "Visibility: Public"
echo "Click *Create Project*"
echo "Press Enter key to continue (After Repository Setup)"
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
break ;
else
echo "waiting for the Gitlab Setup"
fi
done

echo "Pushing to Gitlab Now"

cd /tmp/Github/AAP2_Demos
git remote add gitlab https://git.lab.example.com/student/aap2_demos
git remote set-url origin https://name:password@git.lab.example.com/student/aap2_demos
git push -u gitlab main


echo "**********************************************"
echo "***** Pulling Repository from Gitlab *********"
echo "**********************************************"


mkdir /home/student/Gitlab
cd /home/student/Gitlab
git clone https://git.lab.example.com/student/aap2_demos.git 
