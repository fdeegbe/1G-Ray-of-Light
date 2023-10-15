#!/bin/bash

if [ $# -ne 1 ]
then 
  echo "Usage: container num"
else
  banner=""
  container_num=$1
  if [ $container_num -eq 2 ]
  then
    banner="***********************************
Please be aware that by accessing 
this system, you agree to all our 
guidelines relating to root-level
permissions/commands
***********************************"
  elif [ $container_num -eq 3 ]
  then
    banner="************************************
You have used sudo on this system. 
**User activity and IP are 
monitored and recorded every 24 
hours, and usage is disclosed to 
authorized personnel.** 
Any unauthorized/unlawful attempt 
to use root-level access on this 
system will violate Md. Code Ann. 
Com​m. Law 14-3504 ​and result in 
punishments up to $10,000 in fines.
***********************************"

  elif [ $container_num -eq 4 ]
  then
    banner="*************************************************************************
You are accessing a U.S. Government (USG) Information System (IS) that
is provided for USG-authorized use only. By using this(which includes 
any device attached to this IS), you have consented to these condition: 
                                           
- Any communication or data transiting or stored on this system may be 
    disclosed or used for any lawful government purpose.                       
- Unauthorized or improper use of this system may result in disciplinary 
    action, as well as civil and criminal penalties.
- You have been notified that the use of this system constitutes consent 
    to monitoring and recording.                                               
- Your IP address, login information, and data transactions will be logged 
    and monitored continuously for cybersecurity and investigative purposes.   

Violation or unauthorized use of this system violates federal law under 
United States Code (U.S.C.), Title 18, Section 1030, which provides for 
fines up to $50,000 and imprisonment up to 20 years for unauthorized access 
or for exceeding authorized access to government computers.                                             
                                                                         
You have already acknowledged your understanding with these rules, this 
is simply a reminder because an attempt was made to switch or elevate 
permission.

*************************************************************************"
  fi
  echo "$banner"
fi

