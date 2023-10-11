#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Usage: container name"
    exit 1
else
    container_name=$1
    #make the directory and give it permissions
    sudo lxc-attach -n $container_name -- mkdir -p /var/log/.downloads
    sudo lxc-attach -n $container_name -- chmod 777 /var/log/.downloads

    #Moves the real commands into their paths named real-command
    sudo lxc-attach -n $container_name -- mv /usr/bin/wget /usr/bin/real-wget
    sudo lxc-attach -n $container_name -- mv /usr/bin/curl /usr/bin/real-curl
    sudo lxc-attach -n $container_name -- mv /usr/bin/scp /usr/bin/real-scp
    sudo lxc-attach -n $container_name -- mv /usr/bin/rsync /usr/bin/real-rsync
    sudo lxc-attach -n $container_name -- mv /usr/bin/ftp /usr/bin/real-ftp
    sudo lxc-attach -n $container_name -- mv /usr/bin/sftp /usr/bin/real-sftp
    sudo lxc-attach -n $container_name -- mv /usr/bin/git /usr/bin/real-git

    sudo lxc-attach -n $container_name -- mv /usr/bin/tar /usr/bin/real-tar
    sudo lxc-attach -n $container_name -- mv /usr/bin/gunzip /usr/bin/real-gunzip
    sudo lxc-attach -n $container_name -- mv /usr/bin/gzip /usr/bin/real-gzip
    sudo lxc-attach -n $container_name -- mv /usr/bin/bzip2 /usr/bin/real-bzip2
    sudo lxc-attach -n $container_name -- mv /usr/bin/bunzip2 /usr/bin/real-bunzip2
    sudo lxc-attach -n $container_name -- mv /usr/bin/zip /usr/bin/real-zip
    sudo lxc-attach -n $container_name -- mv /usr/bin/unzip /usr/bin/real-unzip
    sudo lxc-attach -n $container_name -- mv /usr/bin/rar /usr/bin/real-rar
    sudo lxc-attach -n $container_name -- mv /usr/bin/unrar /usr/bin/real-unrar

    sudo lxc-attach -n $container_name -- mv /usr/bin/vim /usr/bin/real-vim
    sudo lxc-attach -n $container_name -- mv /usr/bin/nano /usr/bin/real-nano
    sudo lxc-attach -n $container_name -- mv /usr/bin/emacs /usr/bin/real-emacs

    sudo lxc-attach -n $container_name -- mv /usr/bin/sudo /usr/bin/real-sudo
    
     #Creates the log files and gives them permissions
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/wget && chmod 755 /usr/bin/wget"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/curl && chmod 755 /usr/bin/curl"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/scp && chmod 755 /usr/bin/scp"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/rsync && chmod 755 /usr/bin/rsync"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/ftp && chmod 755 /usr/bin/ftp"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/sftp && chmod 755 /usr/bin/sftp"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/git && chmod 755 /usr/bin/git"

    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/tar && chmod 755 /usr/bin/tar"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/gzip && chmod 755 /usr/bin/gzip"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/gunzip && chmod 755 /usr/bin/gunzip"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/bzip2 && chmod 755 /usr/bin/bzip2"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/bunzip2 && chmod 755 /usr/bin/bunzip2"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/zip && chmod 755 /usr/bin/zip"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/unzip && chmod 755 /usr/bin/unzip"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/rar && chmod 755 /usr/bin/rar"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/unrar && chmod 755 /usr/bin/unrar"

    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/vim && chmod 755 /usr/bin/vim"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/nano && chmod 755 /usr/bin/nano"
    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/emacs && chmod 755 /usr/bin/emacs"

    sudo lxc-attach -n $container_name -- bash -c "touch /usr/bin/sudo && chmod 755 /usr/bin/sudo"

    #Copy the fake commands into where the real commands used to be
    sudo cp poisoned-wget.sh /var/lib/lxc/$container_name/rootfs/usr/bin/wget
    sudo cp poisoned-curl.sh /var/lib/lxc/$container_name/rootfs/usr/bin/curl
    sudo cp poisoned-scp.sh /var/lib/lxc/$container_name/rootfs/usr/bin/scp
    sudo cp poisoned-rsync.sh /var/lib/lxc/$container_name/rootfs/usr/bin/rsync
    sudo cp poisoned-ftp.sh /var/lib/lxc/$container_name/rootfs/usr/bin/ftp
    sudo cp poisoned-sftp.sh /var/lib/lxc/$container_name/rootfs/usr/bin/sftp
    sudo cp poisoned-git.sh /var/lib/lxc/$container_name/rootfs/usr/bin/git

    sudo cp poisoned-tar.sh /var/lib/lxc/$container_name/rootfs/usr/bin/tar
    sudo cp poisoned-gzip.sh /var/lib/lxc/$container_name/rootfs/usr/bin/gzip
    sudo cp poisoned-gunzip.sh /var/lib/lxc/$container_name/rootfs/usr/bin/gunzip
    sudo cp poisoned-bzip2.sh /var/lib/lxc/$container_name/rootfs/usr/bin/bzip2
    sudo cp poisoned-bunzip2.sh /var/lib/lxc/$container_name/rootfs/usr/bin/bunzip2
    sudo cp poisoned-zip.sh /var/lib/lxc/$container_name/rootfs/usr/bin/zip
    sudo cp poisoned-unzip.sh /var/lib/lxc/$container_name/rootfs/usr/bin/unzip
    sudo cp poisoned-rar.sh /var/lib/lxc/$container_name/rootfs/usr/bin/rar
    sudo cp poisoned-unrar.sh /var/lib/lxc/$container_name/rootfs/usr/bin/unrar

    sudo cp poisoned-vim.sh /var/lib/lxc/$container_name/rootfs/usr/bin/vim
    sudo cp poisoned-nano.sh /var/lib/lxc/$container_name/rootfs/usr/bin/nano
    sudo cp poisoned-emacs.sh /var/lib/lxc/$container_name/rootfs/usr/bin/emacs
    sudo cp poisoned-sudo.sh /var/lib/lxc/$container_name/rootfs/usr/bin/sudo

    echo "Commands have been poisoned"
fi