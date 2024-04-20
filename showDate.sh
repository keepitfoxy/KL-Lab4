#!/bin/bash

# Show date
show_date() {
    echo "Dzisiejsza data: $(date)"
}

# Create logs
logs() {
    local num_logs=${1:-100} # Ustawienie domyślnej wartości na 100, jeśli nie podano argumentu
    for ((i=1; i<=num_logs; i++)); do
        echo "log$i.txt, created by $0 on $(date)" > "log$i.txt"
    done
}

# Show help
show_help() {
    echo "Użycie: $0 [opcja]"
    echo "Opcje:"
    echo "  --date, -d  : Wyświetla dzisiejszą datę."
    echo "  --logs, -l [N] : Tworzy N logów. Domyślnie tworzy 100 logów, jeśli nie podano liczby N."
    echo "  --help, -h     : Wyświetla tę pomoc."
    echo "  --init         : Inicjuje skrypt, klonując repozytorium do bieżącego katalogu i ustawiając ścieżkę w PATH."
}

#init
initialize_script() {
    git clone https://github.com/keepitfoxy/KL-Lab4.git .

    export PATH="$(pwd):$PATH"
}

# Main logic
if [[ "$1" == "--date" || "$1" == "-d" ]]; then
    show_date
elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
    logs "$2"
elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
    show_help
elif [[ "$1" == "--init" ]]; then
    initialize_script
else
    logs
fi
