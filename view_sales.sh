#!/bin/bash

sales=$(cat orders.txt)

dialog --title "Sales Report" --msgbox "$sales" 30 70
