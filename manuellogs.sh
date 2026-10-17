#!/bin/bash
[ -z "$1" ] && exit 1
case "$1" in
    error) P=3 ;; advertencia) P=4 ;; *) P=6 ;;
esac
O="$HOME/logs_$1_$(date +%Y-%m).txt"
journalctl -p "$P" --since "$(date +%Y-%m)-01" > "$O"
echo "Guardado: $(wc -l < "$O") registros en $O"