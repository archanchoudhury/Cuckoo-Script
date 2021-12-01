# setup virtual machine
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
echo -e '\e[1;33m *                                             Pulling Win ISO                                          *\e[0m'
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
sudo wget https://cuckoo.sh/win7ultimate.iso


#Mounting Win ISO
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
echo -e '\e[1;33m *                                             Mounting Win ISO                                         *\e[0m'
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
sudo mkdir /mnt/win7
sudo chown cuckoo:cuckoo /mnt/win7/
sudo mount -o ro,loop win7ultimate.iso /mnt/win7

echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
echo -e '\e[1;33m *                                        Setting up virtual machine                                    *\e[0m'
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
sudo apt-get -y install build-essential libssl-dev libffi-dev python-dev genisoimage
sudo apt-get -y install zlib1g-dev libjpeg-dev
sudo apt-get -y install python-pip python-virtualenv python-setuptools swig

pip install -U vmcloak

vmcloak-vboxnet0

vmcloak init --verbose --win7x64 win7x64base --cpus 2 --ramsize 2048

vmcloak clone win7x64base win7x64cuckoo

vmcloak list deps

vmcloak install win7x64cuckoo ie11

vmcloak snapshot --count 1 win7x64cuckoo 192.168.56.101

echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'
echo -e '\e[1;33m *                                        Process Completed Successfully!                               *\e[0m'
echo -e '\e[1;33m *                                 Follow the Final Steps to Interact with Cuckoo                       *\e[0m'
echo -e '\e[1;33m *------------------------------------------------------------------------------------------------------*\e[0m'