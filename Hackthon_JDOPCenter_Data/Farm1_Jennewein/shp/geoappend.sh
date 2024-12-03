#!/bin/bash

usage(){
    echo "obsolete, use ogrmerge.py -single -f GPKG -o merged.gpkg *_Application*.shp"
    exit 0
    echo "$0 target.file source[s]"
}

usage

trg="$1"
shift

for i in "$@"
do
    if [ -f "$trg" ] ; then
        echo "merging $i to $trg"
        ogr2ogr -f 'ESRI Shapefile' -update -append "$trg" "$i" -nln merge
    else
        cp "$i" "$trg"
    fi
done


