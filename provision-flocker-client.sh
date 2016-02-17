#!/bin/sh
sudo apt-get update
sudo apt-get -y install apt-transport-https software-properties-common
sudo add-apt-repository -y "deb https://clusterhq-archive.s3.amazonaws.com/ubuntu/$(lsb_release --release --short)/\$(ARCH) /"
cat <<EOF > /tmp/apt-pref
Package: *
Pin: origin clusterhq-archive.s3.amazonaws.com
Pin-Priority: 700
EOF
sudo mv /tmp/apt-pref /etc/apt/preferences.d/buildbot-700
sudo apt-get update
sudo apt-get -y install --force-yes clusterhq-flocker-cli
