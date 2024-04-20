#!/bin/bash

#show date
show_date() {
    echo "Dzisiejsza data: $(date)"
}

#create logs
logs() {
    for ((i=1; i<=100; i++)); do
        echo "log$i.txt, created by $0 on $(date)" > "log$i.txt"
    done
}

if [[ "$1" == "--date" ]]; then
    show_date
else
    logs
fi
