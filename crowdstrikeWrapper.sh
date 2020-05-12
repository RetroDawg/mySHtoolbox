#!/usr/bin/env bash
# Developer: Jose Arrisola Jr.
# Goal: This script will install the crowdstike package

if [ -x /opt/CrowdStrike ]; then
  echo "CrowdStrike directory exist, please address the service before continuing."
  exit 1
else 
  :
fi

if [ -x /usr/bin/python3 ]; then
  /usr/bin/python3 crowdstrikeInstaller.py
else
  /usr/bin/python crowdstrikeInstaller.py
fi
