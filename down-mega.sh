#! /bin/bash

DIR="~/Downloads/myDown"
if ! [[ -d $DIR ]]; then
  mkdir -p "$DIR"
fi
cd "$DIR"

LINKS=(
# Links mega
)

LOG=~/down.log
if [[ -f $LOG ]]; then
  rm -f $LOG
fi

for i in "${LINKS[@]}"
do
  mega-get --ignore-quota-warn $i | tee -a $LOG
  echo "End $(date +"%H:%M:%S - %d/%m/%Y")" | tee -a $LOG
done