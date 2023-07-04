#!/bin/bash

list_services=$(systemctl list-units --al | grep $1 | awk '{print $1}')

count_service=$(systemctl list-units --all | grep $1 | awk '{print $1}' | wc -l)

if [ $count_service == 0 ]
then
    echo "service not found"
else
    echo "$count_service service is exist"

    for service in ${list_services[@]}; 
      do
        status=$(systemctl show $service | grep ActiveState | cut -f2 -d "=")
        echo "status $service is : $status " 
      done
fi