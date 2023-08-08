#!/bin/bash
#strips all MetaData from images

for x in $(ls)
do 
     typef=$( file $x | cut -d ' ' -f 2 )
     if [ "$typef" == "PNG" ] || [ "$typef" == "JPEG" ]; then
        exiftool -all= $x
     fi
done

  

