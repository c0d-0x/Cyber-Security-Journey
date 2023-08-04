#!/bin/bash
#strips all MetaData from images
for x in $(ls);
do
    exiftool -all= $x
done


