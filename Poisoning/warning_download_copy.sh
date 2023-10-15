#!/bin/bash

if [ $# -ne 1 ]
then 
  echo "Usage: container_variant ID"
else
  container_num=$1
  banner=""
  if [ $container_num -eq 2 ]
  then
    banner="********************************************************
    Please keep in mind that by accessing this system, you agree to all our guidelines relating to the upload/download of files onto this system
    *****************************************************************"
  elif [ $container_num -eq 3 ]
  then
    banner="*********************************************************
    You have either uploaded, downloaded, or copies files onto this system. 
    ** User activity and IP are monitored and recorded every 24 hours, and usage is disclosed to authorized personnel. **
    Any unauthorized or unlawful attempt to exfiltrate data or upload malicious software onto the system will violate MD. Code Ann. Comm. Law 14-3504 and result in punishments up to ten thousand dollars in fines.
    *****************************************************************"
  elif [ $container_num -eq 4 ]
  then
    banner="**********************************************************
    You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only. By using this (including any device attached to this IS), you have consented to the following:
    - Any communication or data transiting or stored on this system may be disclosed or used for any lawful government purpose.
    - Unauthroized or improper use of this system may result in disciplinary action, as well as civil and criminal penalties.
    - You have been notified that the use of this system constitutes consent of monitoring and recording.
    - Your IP address, login information, and data transactions will be logged and monitored continuously for cybersecurity and investigative purposes.

    Violation or unauthorized use of this system violates federal law under United States Code (U.S.C.), Title 18, Section 1030, which provides for fines up to fifty thousand dollars and imprisonment up to twenty years for unauthorized access or for exceeding authorized access to government computers.
    You have already acknowledge your understanding with these rules, this is simply a warning because a transfer of data was detected."
  fi
  echo "$banner"
fi

