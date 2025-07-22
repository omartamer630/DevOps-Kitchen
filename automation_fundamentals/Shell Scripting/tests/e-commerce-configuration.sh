#!/bin/bash

function package_manager_type(){
  # Get the OS info 
if [ -f /etc/os-release ];
then
   . "/etc/os-release"
   os_type=$(echo "$ID $ID_LIKE" | tr '[:upper:]' '[:lower:]')
else
    echo 0
fi

# Check OS Package Manager
if [[ "$os_type" = *"ubuntu"* ]] || [[ "$os_type" = *"debian"* ]]; 
then
      echo 1
elif [[ "$os_type" = *"centos"* ]] || [[ "$os_type" = *"rhel"* ]] || [[ "$os_type" = *"fedora"* ]]; 
then
  if command -v dnf &>/dev/null; then
      echo 2
  else command -v yum &>/dev/null
      echo 3
  fi

fi
}

# Ensure the package manager is up to date
function update_package_manager() {

if [ "$1" = "apt-get" ];
then
# Update package list
  echo "Updating Packages..."
  sudo "$1" update -qq > /dev/null
# Check for upgradable packages
  upgradable=$(apt list --upgradable 2>/dev/null | grep -v "Listing..." | wc -l)

  if [ "$upgradable" -gt 0 ]; then
    echo "$upgradable package(s) can be updated."
    echo "Package(s) will be Updated..."
    sudo "$1" upgrade -y -qq > /dev/null
    echo "Package(s) have Updated"
  else
    echo "All packages are up to date."
  fi
else [[ "$1" = "dnf" ]] || [[ "$1" = "yum" ]];
  echo "Checking Packages..."
  upgradable=$(yum check-update 2>/dev/null | grep -E '^[a-zA-Z0-9]' | wc -l)
  if [ "$upgradable" -gt 0 ]; then
    echo "$upgradable package(s) can be updated."
    echo "Package(s) is being Update..."
    sudo "$1" update -y -q > /dev/null
    echo "Package(s) have been Updated"

  else
    echo "All packages are up to date."
fi
fi
}

# check status
function check_service_status(){
  service_name=$1
  is_active=$(sudo systemctl is-active "$service_name")
  if [ "$is_active" = "active" ];
  then
    echo "$service_name Service is Active"
  else
    echo "$service_name is not active"
    exit 1
  fi
}

# Installing and Configuring Fiewalld
function install_application(){
  package_manager_type="none"
  if [ -w "$2" ];
  then
    package_manager_type=$(cat $2)
  for app in $package_manager_type
    do
    app_default_location=$(which "$app" 2> /dev/null | sed 's|/usr/sbin/||' | sed 's|/usr/bin/||')
    if [ "$app" = "$app_default_location" ];
    then
      echo "$app is Already the newest version"
    else
      sudo $1 install "$app" -y -qq > /dev/null
      sudo systemctl start "$app" > /dev/null
      sudo systemctl enable "$app" > /dev/null
      # Verify the status of app
      check_service_status "$app"
  fi
  done
  else
    for app in $2
      do
    app_default_location=$(which "$app" 2> /dev/null | sed 's|/usr/sbin/||' | sed 's|/usr/bin/||')
    if [ "$app" = "$app_default_location" ];
    then
      echo "$app is Already the newest version"
    else
      sudo $1 install "$app" -y -qq > /dev/null
      sudo systemctl start "$app" > /dev/null
      sudo systemctl enable "$app" > /dev/null
      # Verify the status of app
      check_service_status "$app"
    fi
    done
  fi
}

function check_port(){
  port=$1
  firewall_ports=$(sudo firewall-cmd --list-all --zone=public | grep ports)
  if [[ $firewall_ports == *"$port"* ]];
  then
    echo "$port is configured in the firewall"
  else
    echo "$port is not configured in the firewall"
    exit 1
  fi

}

function database_configuration(){

port=$1
sudo firewall-cmd --permanent --zone=public --add-port="$port"/tcp
sudo firewall-cmd --reload
check_port "$port"
db_name=$2
is_active=$(sudo systemctl is-active "$db_name")
if [ "$is_active" = "active" ];
then
echo "configuring $db_name.."
cat > configure-db.sql <<EOF
CREATE DATABASE ecomdb;
CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';
GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
FLUSH PRIVILEGES;
EOF
sudo mysql < configure-db.sql

# D - Loading inventory data
echo "LOADING $db_name..."
cat > db-load-script.sql <<EOF
USE ecomdb;
CREATE TABLE products (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  Name varchar(255) DEFAULT NULL,
  Price decimal(10,2) DEFAULT NULL,
  ImageUrl varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
);
INSERT INTO products (Name,Price,ImageUrl) VALUES 
  ("Laptop", "100", "c-1.png"),
  ("Drone", "200", "c-2.png"),
  ("VR", "300", "c-3.png"),
  ("Tablet", "5", "c-5.png"),
  ("Watch", "90", "c-6.png"),
  ("Phone", "80", "c-8.png"),
  ("Laptop", "150", "c-4.png");
EOF
sudo mysql < db-load-script.sql
else
  echo "DB Service is not active"
fi
}

# E- Installing and Configuring Apache
function configurate_applicaion(){

# open firewalld port 80
port=$1
sudo firewall-cmd --permanent --zone=public --add-port="$port"/tcp
sudo firewall-cmd --reload
check_port "$port"

# Clone the e-commerce repository
sudo "$2"
}


# Main
package_manager_number=$(package_manager_type)


case $package_manager_number in
  1)  package_manager="apt-get"
        echo "System uses: apt-get"
        update_package_manager "$package_manager" 
        install_application "$package_manager" "$1"
        database_configuration "3306" "mariadb-server"
        configurate_applicaion ;;
  2)  package_manager="dnf"
      echo "System uses: dnf"
      update_package_manager "$package_manager"
      install_application "$package_manager" "$1" 
      database_configuration "3306" "mariadb-server"
      configurate_applicaion "80" ;;
  3)  package_manager="yum"
      echo "System uses: yum"
      update_package_manager "$package_manager"
      install_application "$package_manager" "$1"
      configurate_applicaion "80" "git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/";;
  *)  echo "Cannot detect OS."
      exit ;;
esac
