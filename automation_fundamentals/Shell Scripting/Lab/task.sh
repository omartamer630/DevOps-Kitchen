#!/bin/bash

m=TRUE
contactNumber=1

while [ ${m} = TRUE ];
do
read -p "press (i) to add new contact
press (v) to view all contacts 
press (s) to search for a record
press (e) to delete all contacts
press (d)to delete one contact
press (q) to exit
" choice

function addContact() {

  echo "Contact-${contactNumber}" >> database.txt
  read -p "Enter your First name: " fname
  echo "First Name: $fname" >> database.txt
  read -p "Enter your Last name: " lname
  echo "Last Name: $lname" >> database.txt
  read -p "Enter your Email: " email
  echo "Email: $email" >> database.txt
  read -p "Enter your Phone number: " phnumber
  echo "Phone Number: $phnumber" >> database.txt
  echo "------------------------" >> database.txt
  
  ((contactNumber++))
}
function viewAllContacts() {
    if [ -f "database.txt" ]; then
    echo "------------------------"
    echo "All Contacts"
    echo "------------------------"
    cat database.txt
  else
    echo "No contacts found."
  fi
}
function searchContact() {
    read -p "Enter the name of the contact you want to search for: " searchName
  if [ -f "database.txt" ]; then
    sed -n "/First Name: ${searchName}/,/------------------------/p" database.txt
  else
    echo "No contacts found."
  fi
}
function deleteAllContacts() {
  if [ -f "database.txt" ]; then
    rm database.txt
    echo "------------------------"
    echo "All contacts deleted."
    echo "------------------------"
  else
    echo "No contacts to delete."
  fi
}
function deleteOneContact(){
    if [ -f "database.txt" ]; then
    read -p "Enter the contact number you want to delete (e.g., 1 for Contact-1): " deleteNumber
    sed -i "/Contact-${deleteNumber}/,/------------------------/d" database.txt
    echo "Contact-${deleteNumber} deleted if it existed."
  else
    echo "No contacts found."
  fi
}
case ${choice} in
 "i")
    addContact  #add new contact 
  ;;
 "v") 
    viewAllContacts # view all contacts
  ;;
 "s") 
    searchContact # search for a contact
  ;;
 "e") 
    deleteAllContacts # delete all contacts
  ;;
 "d") 
    deleteOneContact # delete one contact
  ;;
 "q") 
    exit # exit
  ;;
  *) 
  echo "Invalid option. Please try again." # invalid option
  ;;
esac

if [ "${choice}" != "q" ]; then
  read -p "If you want to return to the main menu press m or q for exit: " reptear
  if [ "${reptear}" != "m" ]; then
    m=FALSE
  fi
fi

done
