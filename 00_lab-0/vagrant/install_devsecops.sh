#!/bin/bash
sudo apt-get update

# install prerequisites
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y
sudo apt-get install -y idle3

# install vscode
sudo apt-get install snapd -y
sudo snap install --classic code

# install ngrok
sudo snap install ngrok

# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# install gitlab-runner
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
sudo apt-get install -y gitlab-runner
sudo gitlab-runner -version
sudo systemctl start gitlab-runner.service
sudo systemctl enable gitlab-runner.service

# Install docker
sudo curl -fsSL get.docker.com -o get-docker.sh && sudo sh get-docker.sh
sudo usermod -aG docker vagrant
sudo systemctl enable docker
sudo systemctl start docker

# keyboard settings
sudo apt-get install x11-xkb-utils
sudo setxkbmap fr
echo "setxkbmap fr" >> /home/vagrant/.bashrc
sudo chown vagrant:vagrant /home/vagrant/.bashrc
sudo apt-get install x11-xkb-utils
sudo setxkbmap fr
echo "setxkbmap fr" >> /home/vagrant/.bashrc
sudo chown vagrant:vagrant /home/vagrant/.bashrc
sudo timedatectl set-timezone Europe/Paris
sudo sed -i  "s/'de/'fr/g" /etc/xdg/autostart/input-source.desktop
sudo sed -i  "s/'us/'fr/g" /etc/xdg/autostart/input-source.desktop

echo "##############"
echo "## VM ready ##"
echo "##############"
echo "For this Stack, you will use $(ip -f inet addr show enp0s8 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p') IP Address"
echo "The VM will restart, please wait until 2 minutes before connection the VM"
sudo reboot