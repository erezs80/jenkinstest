#!/bin/bash
file=/var/lib/jenkins/counter.log
if [[ ! -f $file ]]; then
	echo "0" > /var/lib/jenkins/counter.log
else
	counter=`cat /var/lib/jenkins/counter.log`
	counter=$((counter+1))
	echo $counter > /var/lib/jenkins/counter.log
	if [ $counter -lt 3 ]; then
		ca /tmp/test.txt
	else
		echo "Initial_JOB_NAME = $1"
		echo "0" > /var/lib/jenkins/counter.log
	fi
fi
