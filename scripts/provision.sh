#!/bin/bash
#I used this method because the plugin refused to work, same with inline shell (I think)
echo "****** Are we getting here?******"
sudo apt-get update
wget https://apt.puppetlabs.com/puppet5-release-$(lsb_release -cs).deb
dpkg -i puppet5-release-$(lsb_release -cs).deb
sudo apt-get -qq update
sudo apt-get install -y puppet-agent
echo "****** puppet actually installed this way******"