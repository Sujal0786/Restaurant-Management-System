#!/bin/bash

# Welcome Loop
while true
do
    choice=$(dialog --clear --stdout --title "Restaurant Management System" \
        --menu "Choose an option:" 15 50 6 \
        1 "Show Menu" \
        2 "Take Order" \
        3 "Admin Options" \
        4 "View Sales" \
        5 "Exit")

    case $choice in
        1) bash show_menu.sh ;;
        2) bash take_order.sh ;;
        3) bash admin_options.sh ;;
        4) bash view_sales.sh ;;
        5) break ;;
    esac
done
