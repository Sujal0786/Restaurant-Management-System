#!/bin/bash

order_list=""
total=0

while true
do
    item_id=$(dialog --inputbox "Enter Item ID to order (or type 0 to finish):" 10 30 --stdout)
    
    if [ "$item_id" -eq 0 ]; then
        break
    fi

    quantity=$(dialog --inputbox "Enter Quantity:" 10 30 --stdout)

    item_info=$(grep "^$item_id|" menu.txt)

    if [ -z "$item_info" ]; then
        dialog --msgbox "Invalid Item ID!" 5 30
    else
        item_name=$(echo $item_info | awk -F'|' '{print $2}')
        item_price=$(echo $item_info | awk -F'|' '{print $3}')
        item_total=$((item_price * quantity))
        total=$((total + item_total))
        order_list="$order_list\n$item_name x $quantity = ₹$item_total"
    fi
done

echo -e "$order_list\n---------------------\nTotal Bill: ₹$total\n" >> orders.txt

dialog --title "Order Summary" --msgbox "$order_list\n---------------------\nTotal Bill: ₹$total" 20 50
