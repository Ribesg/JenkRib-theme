#!/bin/bash -xe
# Requires YUI Compressor as 'yc'

for FILEPATH in *.css *.js
do
  FILE=$(basename "$FILEPATH")
  TYPE="${FILE##*.}"
  NAME="${FILE%.*}"
  yc --type $TYPE -o "$NAME.min.$TYPE" "$FILE"
done
