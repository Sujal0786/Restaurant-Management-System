#!/bin/bash

admin_choice=$(dialog --stdout --menu "Admin Options" 15 50 4 \
    1 "Add New Item" \
    2 "Update Item Price" \
    3 "Delete Item" \
    4 "Back")

case $admin_choice in
    1)
        id=$(dialog --inputbox "Enter New Item ID:" 8 40 --stdout)
        name=$(dialog --inputbox "Enter New Item Name:" 8 40 --stdout)
        price=$(dialog --inputbox "Enter Price:" 8 40 --stdout)
        echo "$id|$name|$price" >> menu.txt
        dialog --msgbox "Item Added Successfully!" 6 30
        ;;
    2)
        id=$(dialog --inputbox "Enter Item ID to Update:" 8 40 --stdout)
        new_price=$(dialog --inputbox "Enter New Price:" 8 40 --stdout)
        sed -i "/^$id|/s/|[^|]*$/|$new_price/" menu.txt
        dialog --msgbox "Price Updated Successfully!" 6 30
        ;;
    3)
        id=$(dialog --inputbox "Enter Item ID to Delete:" 8 40 --stdout)
        sed -i "/^$id|/d" menu.txt
        dialog --msgbox "Item Deleted Successfully!" 6 30
        ;;
    4) ;;
esac
