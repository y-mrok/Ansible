#!/bin/sh

grep $1 /etc/passwd
if [ $? -eq 0 ]
then
  exit 0 
elif [ $? -eq 1 ]
then
  sudo useradd $1
  exit 1
else
  exit 9
fi
