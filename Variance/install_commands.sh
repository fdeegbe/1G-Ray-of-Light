#!/bin/bash

# We will be tracking the following commands: tar, gzip/gunzip, bzip2/bunzip2, zip/unzip
# rar/unrar, wget, curl, scp, rsync, ftp/sftp, git, aria2, axel

# This script assumes that containers have been created and started
if [ $# -ne 1 ]
then
    echo "Usage: container name"
else
    container_name=$1
    sudo lxc-attach -n $container_name -- bash -c "sudo apt-get update && sleep 1 && \
        sudo apt-get install -y man && sleep 1 && \
        sudo apt-get install -y wget && sleep 1 && \
        sudo apt-get install -y curl && sleep 1 && \
        sudo apt-get install -y zip && sleep 1 && \
        sudo apt-get install -y unzip && sleep 1 && \
        sudo apt-get install -y rsync && sleep 1 && \
        sudo apt-get install -y rar && sleep 1 && \
        sudo apt-get install -y nano && sleep 1 && \
        sudo apt-get install -y emacs && sleep 1 && \
        sudo apt-get install -y ftp && sleep 1 && \
        sudo apt-get install -y git && sleep 1 && \
        sudo apt-get install -y unrar && sleep 1 && \
        sudo apt-get install -y aria2 && sleep 1 && \
        sudo apt-get install -y axel"

    echo "Successfully installed the following commands: tar, gzip/gunzip, bzip2/bunzip2, zip/unzip\
    rar/unrar, wget, curl, scp, rsync, ftp/sftp, git, aria2, axel rsync nano emacs"
fi
