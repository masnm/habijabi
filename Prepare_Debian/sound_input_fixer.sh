#!/bin/bash

set -xe

sudo touch /etc/udev/rules.d/jackdetect.rules

sudo echo 'ACTION=="add", SUBSYSTEM=="sound", ATTRS{chip_name}=="ALCS1200A", ATTR{hints}="jack_detect=false"' >> jackdetect.rules
sudo echo 'ACTION=="add", SUBSYSTEM=="sound", ATTRS{chip_name}=="ALCS1200A", ATTR{reconfig}="1"' >> jackdetect.rules

sudo mv jackdetect.rules /etc/udev/rules.d/jackdetect.rules
