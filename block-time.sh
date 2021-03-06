#!/bin/bash
################################################################################
#
# Script created by @samnoble @ankh2054 for https://eosdublin.com & https://www.eos42.io
#
# Visit https://github.com/eos42/scripts/ for details.
#
################################################################################
DIR=/opt/JungleTestnet-panthereos42
PRODUCER=panthereos42
TIMESTAMP="$($DIR/cleos.sh get table eosio eosio producers -l 150 | grep $PRODUCER -A 8 | grep last_produced_block | cut -d':' -f2)"
if [ "$(uname)" == "Darwin" ]; then
    date -d "$((($TIMESTAMP * 500 + 946684800000) / 1000))"      
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    date --date "@$((($TIMESTAMP * 500 + 946684800000) / 1000))"
else
    echo "Unsupported system"
fi
