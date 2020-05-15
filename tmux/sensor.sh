#!/bin/sh
# Outputs the defined sensor in C
# sensor path needs to be in jq format
# example:
#   # printf "CPU: " && sensor.sh '."k10temp-pci-00c3"."Tdie"."temp1_input" | round'
if [ -z "$1" ]; then
    exit 1
fi
sensors -j | jq -j "$1" && printf " C"
