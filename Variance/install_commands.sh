#!/bin/bash

# We will be tracking the following commands: tar, gzip/gunzip, bzip2/bunzip2, zip/unzip
# rar/unrar, wget, curl, scp, rsync, ftp/sftp, git, aria2, axel

# This script assumes that containers have been created and started
if [ $# -ne 1 ]
then
    echo "Usage: container name"
else
    container_name=$1
    sudo lxc-attach -n $container_name -- bash -c "sudo apt-get update && \
                                                   sudo apt-get install wget curl zip unzip \
                                                   ftp git unrar aria2 axel"
    echo "Successfully installed the following commands: tar, gzip/gunzip, bzip2/bunzip2, zip/unzip\
    rar/unrar, wget, curl, scp, rsync, ftp/sftp, git, aria2, axel"
fi