#!/bin/bash -xe
# Requires Stylus and YUI Compressor as 'yc'

for FILEPATH1 in *.styl
do
  FILE1=$(basename "$FILEPATH1")
  TYPE1="${FILE1##*.}"
  NAME1="${FILE1%.*}"
  stylus "$FILE1" -p > "$NAME1.css"
  stylus "$FILE1" -c -p > "$NAME1.min.css"
done

for FILEPATH2 in *.js
do
  FILE2=$(basename "$FILEPATH2")
  TYPE2="${FILE2##*.}"
  NAME2="${FILE2%.*}"
  yc --type $TYPE2 -o "$NAME2.min.$TYPE2" "$FILE2"
done
