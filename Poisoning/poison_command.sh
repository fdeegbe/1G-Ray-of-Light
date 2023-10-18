#!/bin/bash
# if you run this with a container more than once you will die
if [ $# -ne 2 ]
then
    echo "Usage: container name and variance level"
    exit 1
else
    container_name=$1
    variance_level=$2
    # make the directory and give it permissions
    sudo lxc-attach -n $container_name -- mkdir -p /var/log/.downloads
    sudo lxc-attach -n $container_name -- chmod 777 /var/log/.downloads

    sudo cp -r "/1G-Ray-of-Light/Poisoning/level$variance_level" "/var/lib/lxc/$container_name/rootfs/usr/.warning_messages"
    
    # Moves the real commands into their paths named real-command
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
    sudo lxc-attach -n $container_name -- mv /usr/bin/more /usr/bin/real-more
    sudo lxc-attach -n $container_name -- mv /usr/bin/less /usr/bin/real-less
    
    sudo lxc-attach -n $container_name -- mv /usr/bin/su /usr/bin/real-su

    sudo lxc-attach -n $container_name -- mv /usr/sbin/adduser /usr/sbin/real-adduser
    sudo lxc-attach -n $container_name -- mv /usr/sbin/deluser /usr/sbin/real-deluser
    sudo lxc-attach -n $container_name -- mv /usr/bin/passwd /usr/bin/real-passwd
    sudo lxc-attach -n $container_name -- mv /usr/sbin/groupadd /usr/sbin/real-groupadd
    sudo lxc-attach -n $container_name -- mv /usr/sbin/groupmod /usr/sbin/real-groupmod
    sudo lxc-attach -n $container_name -- mv /usr/sbin/groupdel /usr/sbin/real-groupdel
    
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


    #Copy the fake commands into where the real commands used to be
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-wget.sh /var/lib/lxc/$container_name/rootfs/usr/bin/wget
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-curl.sh /var/lib/lxc/$container_name/rootfs/usr/bin/curl
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-scp.sh /var/lib/lxc/$container_name/rootfs/usr/bin/scp
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-rsync.sh /var/lib/lxc/$container_name/rootfs/usr/bin/rsync
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-ftp.sh /var/lib/lxc/$container_name/rootfs/usr/bin/ftp
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-sftp.sh /var/lib/lxc/$container_name/rootfs/usr/bin/sftp
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-git.sh /var/lib/lxc/$container_name/rootfs/usr/bin/git

    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-tar.sh /var/lib/lxc/$container_name/rootfs/usr/bin/tar
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-gzip.sh /var/lib/lxc/$container_name/rootfs/usr/bin/gzip
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-gunzip.sh /var/lib/lxc/$container_name/rootfs/usr/bin/gunzip
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-bzip2.sh /var/lib/lxc/$container_name/rootfs/usr/bin/bzip2
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-bunzip2.sh /var/lib/lxc/$container_name/rootfs/usr/bin/bunzip2
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-zip.sh /var/lib/lxc/$container_name/rootfs/usr/bin/zip
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-unzip.sh /var/lib/lxc/$container_name/rootfs/usr/bin/unzip
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-rar.sh /var/lib/lxc/$container_name/rootfs/usr/bin/rar
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-unrar.sh /var/lib/lxc/$container_name/rootfs/usr/bin/unrar

    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-vim.sh /var/lib/lxc/$container_name/rootfs/usr/bin/vim
    sudo lxc-attach -n $container_name -- bash -c "chmod 755 /usr/bin/vim"
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-nano.sh /var/lib/lxc/$container_name/rootfs/usr/bin/nano
    sudo lxc-attach -n $container_name -- bash -c "chmod 755 /usr/bin/nano"
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-emacs.sh /var/lib/lxc/$container_name/rootfs/usr/bin/emacs
    sudo lxc-attach -n $container_name -- bash -c "chmod 755 /usr/bin/emacs"
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-su.sh /var/lib/lxc/$container_name/rootfs/usr/bin/su
    sudo lxc-attach -n $container_name -- bash -c "chmod 755 /usr/bin/su"
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-more.sh /var/lib/lxc/$container_name/rootfs/usr/bin/more
    sudo lxc-attach -n $container_name -- bash -c "chmod 755 /usr/bin/more"
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-less.sh /var/lib/lxc/$container_name/rootfs/usr/bin/less
    sudo lxc-attach -n $container_name -- bash -c "chmod 755 /usr/bin/less"

    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-adduser.sh /var/lib/lxc/$container_name/rootfs/usr/sbin/adduser
    sudo lxc-attach -n $container_name -- bash -c "chmod 755 /usr/sbin/adduser"
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-deluser.sh /var/lib/lxc/$container_name/rootfs/usr/sbin/deluser
    sudo lxc-attach -n $container_name -- bash -c "chmod 755 /usr/sbin/deluser"
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-groupadd.sh /var/lib/lxc/$container_name/rootfs/usr/sbin/groupadd
    sudo lxc-attach -n $container_name -- bash -c "chmod 755 /usr/sbin/groupadd"
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-groupdel.sh /var/lib/lxc/$container_name/rootfs/usr/sbin/groupdel
    sudo lxc-attach -n $container_name -- bash -c "chmod 755 /usr/sbin/groupdel"
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-groupmod.sh /var/lib/lxc/$container_name/rootfs/usr/sbin/groupmod
    sudo lxc-attach -n $container_name -- bash -c "chmod 755 /usr/sbin/groupmod"
    sudo cp /1G-Ray-of-Light/Poisoning/poisoned-passwd.sh /var/lib/lxc/$container_name/rootfs/usr/bin/passwd
    sudo lxc-attach -n $container_name -- bash -c "chmod 755 /usr/bin/passwd"

    echo "Commands have been poisoned"
fi
