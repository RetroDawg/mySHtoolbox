#!/usr/bin/env bash
# Developer: Jose Arrisola Jr.
# Goal: This script is the initial check for crowdstrike and installation
#Define python paths
py2_path=`type -P python`
type -P python
checkpoint_python2=`echo $?`
py3_path=`type -P python3`
type -P python3
checkpoint_python3=`echo $?`

if ( [ $checkpoint_python2 -ne 0 ] && [ checkpoint_python3 -ne 0 ] ); then
  echo "No Python version is detected. Exiting."
  exit 1
else
  :
fi

if [ -x /opt/CrowdStrike ]; then
  echo "CrowdStrike directory exist, please address the service before continuing."
  exit 1
else 
  :
fi

curl -o /tmp/crowdstrikeInstaller.py https://repo.geos.tamu.edu/common-configs/toolbox/crowdstrikeInstaller.py && chmod +x /tmp/crowdstrikeInstaller.py

if [ $checkpoint_python3 -eq 0 ]; then
  $py3_path /tmp/crowdstrikeInstaller.py
else
  curl -o /tmp/python3Installer.py https://repo.geos.tamu.edu/common-configs/toolbox/python3Installer.py && chmod +x /tmp/python3Installer.py
  $py2_path /tmp/python3Installer.py
  type -P python3
  checkpoint=`echo $?`
  if [ $checkpoint -eq 0 ]; then
  echo "python3Installer.py successfully installed python3."
  py3_path=`type -P python3`
  $py3_path /tmp/crowdstrikeInstaller.py  
  else
    echo "python3Installer.py failed to install python3 exiting."
    exit 1
  fi
fi
