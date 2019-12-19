# Installing gcloud
sudo apt-get install gcloud

# SSH Connect gcloud command
gcloud beta compute --project "webhosting-262514" ssh --zone "us-west2-a" "organicserver"

# Checking performance
htop

# Allocating Swap Memory
sudo fallocate -l 2G /swapfile

# Wiping Swap
sudo dd if=/dev/zero of=/swapfile bs=2560 count=1048576

# Securing Swap file (readable only by root)
sudo chmod 600 /swapfile

# Making Swap file
sudo mkswap /swapfile

# Turn on Swap file
sudo swapon /swapfile

# Editing sftab on reboot
sudo nano /etc/fstab 
 >>
 /swapfile swap swap defaults 0 0
 
 sudo mount -a
 
 # veryfy swap with htop
 
 ####
 # Installing LAMP Stack
 
 # Helper - adding packages to apt
 sudo apt install tasksel
 
 # Installing LAMP
 sudo tasksel install lamp-server
 
 # Extar Stuff
 sudo apt install php-curl php-gd php7.2-xml php-xmlrpc
 
 sudo vi /etc/apt/sources.list
 
>>
deb http://archive.ubuntu.com/ubuntu bionic main universe
deb http://archive.ubuntu.com/ubuntu bionic-security main universe
deb http://archive.ubuntu.com/ubuntu bionic-updates main universe
 
 sudo apt update
 
 sudo apt install php-mbstring
 
 #### Configuration
 
 # Grabbing External IP
 curl ifconfig.me
 
 ## Do DNS Stuff - Add "A" Record
 
 # Setup Domain name on Apache Config
 cd /etc/apache2/sites-available/
 
 
 
 
 
 
