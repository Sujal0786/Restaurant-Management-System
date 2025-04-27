#!/bin/bash

menu=$(cat menu.txt | awk -F'|' '{print $1" - "$2" : ₹"$3}')

dialog --title "Restaurant Menu" --msgbox "$menu" 20 50
