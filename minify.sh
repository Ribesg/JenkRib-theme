#!/bin/sh -xe
# Requires YUI Compressor as 'yc'

for PATH in *.css *.js
do
  FILE=$(/usr/bin/basename "$PATH")
  TYPE="${FILE##*.}"
  NAME="${FILE%.*}"
  yc --type $TYPE -o "$NAME.min.$TYPE" "$FILE"
done