## dbfinfo

```
for i in *.dbf; do echo "# $i"; dbfdump "$i"| head -2;done |tee  dbfhead.tsv
```

## 10x10m grid


```
Algorithm 'Create grid' starting…
Input parameters:
{ 'CRS' : QgsCoordinateReferenceSystem('EPSG:25832'), 'EXTENT' : '7.831513333,7.839298262,49.556547838,49.559556306 [EPSG:4326]', 'HOVERLAY' : 0, 'HSPACING' : 10, 'OUTPUT' : 'TEMPORARY_OUTPUT', 'TYPE' : 2, 'VOVERLAY' : 0, 'VSPACING' : 10 }
```

