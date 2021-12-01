# System Update
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
echo -e '\e[1;33m *                                   Upgrading and Updating the system                                  *\e[0m'
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
sudo apt update
sudo apt upgrade


# Install Dependencies
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
echo -e '\e[1;33m *                                   Installing Prelim Dependencies                                     *\e[0m'
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
sudo apt-get install python python-pip python-dev libffi-dev libssl-dev -y
sudo apt-get install python-virtualenv python-setuptools -y
sudo apt-get install libjpeg-dev zlib1g-dev swig -y
sudo apt-get install mongodb -y
sudo apt-get install postgresql libpq-dev -y
sudo apt install virtualbox -y
sudo apt-get install tcpdump apparmor-utils -y


#Create and assign proper pcap user and permisson
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
echo -e '\e[1;33m *                            Getting the Privileges Fixed for tcpdump                                  *\e[0m'
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
sudo groupadd pcap
sudo usermod -a -G pcap blackperl
sudo chgrp pcap /usr/sbin/tcpdump
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
getcap /usr/sbin/tcpdump
sudo aa-disable /usr/sbin/tcpdump
sudo usermod -a -G vboxusers blackperl
sudo su blackperl


#Installing Crypto Libraries 
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
echo -e '\e[1;33m *                                  Installing Crypto Libraries                                         *\e[0m'
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
sudo apt-get install swig
sudo pip install m2crypto

#sudo usermod -a -G vboxusers blackperl
#sudo su blackperl

# install virtualenv
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
echo -e '\e[1;33m *                             Installing virtual environment wrapper                                   *\e[0m'
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
sudo apt-get update && sudo apt-get -y install virtualenv

# install virtualenvwrapper
sudo apt-get -y install virtualenvwrapper

echo "source /usr/share/virtualenvwrapper/virtualenvwrapper.sh" >> ~/.bashrc

# install pip for python3
sudo apt-get -y install python3-pip

# turn on bash auto-complete for pip
pip3 completion --bash >> ~/.bashrc

# avoid installing with root
pip3 install --user virtualenvwrapper

echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc

echo "source ~/.local/bin/virtualenvwrapper.sh" >> ~/.bashrc

export WORKON_HOME=~/.virtualenvs

echo "export WORKON_HOME=~/.virtualenvs" >> ~/.bashrc

echo "export PIP_VIRTUALENV_BASE=~/.virtualenvs" >> ~/.bashrc 

echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
echo -e '\e[1;33m *                                        Process Completed Successfully!                               *\e[0m'
echo -e '\e[1;33m *                            Initialize Virtual Env, Install setuptools and cuckoo.                    *\e[0m'
echo -e '\e[1;33m *                                         Then, run Cuckoo-vm.sh Script                                *\e[0m'
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
