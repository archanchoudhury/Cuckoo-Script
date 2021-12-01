# Cuckoo-Script
This has been created for them who wants to create Cuckoo Sandbox in their environment for easy and quick Triage of Sample Files. The steps are for building Cuckoo Sandbox on a Multilayered Virtualization Environment
* In return get me some subscribers for my YouTube Channel 👉 https://www.youtube.com/c/BlackPerl
* If you like to support my creation and pay me back a little, you can buy me a coffee ☕ https://www.buymeacoffee.com/BlackPerl

### How to use
* Prepare your Ubuntu18 VM in any virtualization application. I have used VirtualBox for testing.
* Make Sure, you have Extended Feature- "Enable Nested VT-x/AMD-V" is enabled in the Processor.
* Once you login to your VM, open Ternimanl and pull down Cuckoo-pre1.sh script and run it. It will install all of the Dependecies that we need for this Process.
* Once done run the below commands-
  *  source ~/.bashrc
  *  mkvirtualenv -p python2.7 cuckoo-test
  *  pip install -U pip setuptools
  *  pip install -U cuckoo
* Now pull down Cuckoo-vm script and run it. It will set up the virtual environment under which the Win7 vm will be running. It will be a headless installation.
* Once done run the below commands-
  *   vmcloak list vms
  *   cuckoo init
  *   cuckoo community
  *   while read -r vm ip; do cuckoo machine --add $vm $ip; done < <(vmcloak list vms)
  *   sudo sysctl -w net.ipv4.conf.vboxnet0.forwarding=1
  *   sudo sysctl -w net.ipv4.conf.*your interface name*.forwarding=1
  *   sudo iptables -t nat -A POSTROUTING -o *your interface name* -s 192.168.56.0/24 -j MASQUERADE
  *   sudo iptables -P FORWARD DROP
  *   sudo iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
  *   sudo iptables -A FORWARD -s 192.168.56.0/24 -j ACCEPT
  *   cuckoo rooter --sudo --group opensecure
  *   cuckoo web --host 127.0.0.1 --port 8080
* For the detailed installation, please checkout the video tutorial here- 
