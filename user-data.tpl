#!/bin/bash
logit() {
   while read LINE
   do
      LOGFILE=/var/log/user-data.log
      STAMP=$(date +"%Y-%m-%d %H:%M:%S")
      echo "$STAMP       $LINE" >> $LOGFILE
   done

}

set -x
((
##################################### USER  DATA START ############################################
echo "========"
sudo su -
yum remove java-1.7.0-openjdk -y
sudo yum upgrade
sudo yum install java-1.8.0 -y
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo yum update -y
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y --nogpgcheck
sudo service jenkins start
sudo chkconfig jenkins on
echo "Vande Matram"
echo "========"

##################################### USER DATA END #######################################
) 2>&1)  | logit

