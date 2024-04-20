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

# Create error files
create_errors() {
    local num_errors=$1
    for ((i=1; i<=num_errors; i++)); do
        echo "error$i.txt, created by $0 on $(date)" > "error$i.txt"
    done
}

# Show help
show_help() {
    echo "Użycie: $0 [opcja]"
    echo "Opcje:"
    echo "  --date, -d       : Wyświetla dzisiejszą datę."
    echo "  --logs, -l [N]   : Tworzy N logów. Domyślnie tworzy 100 logów, jeśli nie podano liczby N."
    echo "  --error, -e [N]  : Tworzy N plików z błędami. Domyślnie tworzy 100 plików, jeśli nie podano liczby N."
    echo "  --help, -h       : Wyświetla tę pomoc."
    echo "  --init           : Inicjuje skrypt, klonując repozytorium do bieżącego katalogu i ustawiając ścieżkę w PATH."
}

# Initialize script
initialize_script() {
    # Clone repository to current directory
    git clone https://github.com/keepitfoxy/KL-Lab4.git .

    # Add current directory to PATH
    export PATH="$(pwd):$PATH"
}

# Main logic
if [[ "$1" == "--date" || "$1" == "-d" ]]; then
    show_date
elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
    logs "$2"
elif [[ "$1" == "--error" || "$1" == "-e" ]]; then
    create_errors "${2:-100}"
elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
    show_help
elif [[ "$1" == "--init" ]]; then
    initialize_script
else
    logs
fi