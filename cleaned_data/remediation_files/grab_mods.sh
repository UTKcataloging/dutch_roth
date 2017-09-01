#!/bin/bash
 
HOST="digital.lib.utk.edu/collections"
PROT="https"
PIDS="roth.txt"


cat $PIDS | while read line; do
  curl "$PROT://$HOST/islandora/object/$line/datastream/MODS" > "../mods_by_pid/$line.xml"
done 

