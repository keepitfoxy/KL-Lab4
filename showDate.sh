#!/bin/bash

#show date
show_date() {
    echo "Dzisiejsza data: $(date)"
}

#create logs
logs() {
    local num_logs=${1:-100} # Ustawienie domyślnej wartości na 100, jeśli nie podano argumentu
    for ((i=1; i<=num_logs; i++)); do
        echo "log$i.txt, created by $0 on $(date)" > "log$i.txt"
    done
}

if [[ "$1" == "--date" ]]; then
    show_date
elif [[ "$1" == "--logs" ]]; then
    logs "$2"
else
    logs
fi
