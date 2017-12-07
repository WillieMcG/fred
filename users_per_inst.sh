#!/bin/bash
#
# institutes2.csv contains
# Ticket, Responses, Reporter, Institute
#
set -u

# Get a list of the institutes
insts=$(cat institutes2.csv | grep -v Institute | awk -F, '{ print $4 }' | sort -u)

for inst in $insts
do
  num_users=$(grep "$inst\$" institutes2.csv | awk -F, '{ print $3 }' | sort -u | wc -l)
  echo $inst, $num_users
done
