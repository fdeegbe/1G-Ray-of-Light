# 1G-Ray-of-Light

## Sign-In

The username is
`fdeegbe`
the password is
```bash
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
```

## Bash-Demos
### Contains the demos for our creation and destruction scripts


## Usage

Simply `git glone \[link\]` this repository into the VM where the containers will be spawned from. Then move the repository to the root (/) directory (the cron calls will use full paths so this is important). You should see updating log files in the /MITM/mitm_logs file.

### Setup/setup
This script will run and set everything up. This script will start the firewall rules, install forever, clone the MITM server into the root directory, set up cron jobs, and make sure necessary files have correct permissions.

### Recycling-LXC-Version/recycle
This script will generate 4 random numbers, change permissions on recycle-delete and recycle-create, run the recycle-delete script, and then run the recycle-create script 4 times passing in the random number that was generated (which indicates what type of system the container will be configured as) in addition to the external IP, the MITM port number, and the container name.

### Recycling-LXC-Version/recycle-create
This script will create and start a container, install openssh on the container, set up the container to whatever "level" it is randomly designated for (from the variable passed in from recycle), set up the log file locations, start the MITM process, and add the necessary nat rules.

### Recycling-LXC-Version/recycle-delete
This script will stop all forever (MITM) processes, stop and destroy the containers, and delete the nat rules.




## Testing
When pushing/pulling on the development server, git will ask you for a password. You can use this fine-grained access token

ignore this
```bash
git config --global credential.https://github.com.username your-username
git config --global credential.https://github.com.token your-access-token
git config --global --unset credential.helper
```


 ## Version
 ```
 NAME="Ubuntu"
VERSION="20.04.6 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.6 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal
```
