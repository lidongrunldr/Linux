#!/bin/bash
for i in {1..32}
do 
  date=$(printf "%02d" $i)
  ai-models --assets"/fourcastnet" --input cds --date 202403${date} --time 1800 fourcastnetv2-small --lead-time 360 --path /mnt/ssd1/acount/fourcastnet/result/202403${date}_18_output.grib
done 
