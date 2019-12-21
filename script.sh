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
 cp 000-default.conf sitename.com.conf
 
 >>>
 <Directory /var/www/html>
  Require all granted
 </Directory>
 ...
 ServerName servaername.com
 ServerAlias www.servername.com
 
 # Disable Default
 a2dissite 000-default.conf
 
 # Enable Custom
 a2ensite sitename.com.conf
 
 # Database Operations
 mysql -u root
 
 CREATE DATABASE dbname;
 GRANT ALL ON dbname.* TO 'dbuser' IDENTIFIED BY 'password';
 
 quit
 
 mysql_secure_installation
 
 # Yes to All
 
 # PHP Conf break limitations
 nano /etc/php/7.2/apache2/php.ini
 
 # Installing Wordpress
 cd /ver/www/html/
 wget https://wordpress.org/latest.tar.gz
 tar -xvf latest.tar.gz
 ## edit wp-config.php file from sample
 

 ## DONE
 
 nano /etc/apache2/mods-enabled/mpm-prefork.conf
 >>>
 1
 2
 5
 10
 1000
 
 # Sec Scan
 wget https://raw.githubusercontent.com/richardforth/apache2buddy/master/apache2buddy.pl
 chmod +x apache2buddy.pl
 ./apache2buddy.pl
 
 
 ## Youtube Link
 # https://www.youtube.com/watch?v=vIJdypOqlL4
 
 ## Installing LAMP
 # https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-ubuntu-18-04
 
