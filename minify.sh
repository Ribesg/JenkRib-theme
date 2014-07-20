#!/bin/bash -xe
# Requires Stylus and YUI Compressor as 'yc'

for FILEPATH in *.styl
do
  stylus $(basename "$FILEPATH")
done

for FILEPATH in *.css *.js
do
  FILE=$(basename "$FILEPATH")
  TYPE="${FILE##*.}"
  NAME="${FILE%.*}"
  yc --type $TYPE -o "$NAME.min.$TYPE" "$FILE"
done
