#!/usr/bin/env bash
# Developer: Jose Arrisola Jr.
# Goal: This script will install the crowdstike package

if [ -x /usr/bin/python3 ]; then
  /usr/bin/python3 crowdstrikeInstaller.py
else
  /usr/bin/python crowdstrikeInstaller.py
fi
