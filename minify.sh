#!/bin/bash -xe
# Requires YUI Compressor as 'yc'

env

for PATH in *.css *.js
do
  FILE=$(basename "$PATH")
  TYPE="${FILE##*.}"
  NAME="${FILE%.*}"
  yc --type $TYPE -o "$NAME.min.$TYPE" "$FILE"
done
