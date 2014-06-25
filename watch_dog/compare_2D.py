#!/usr/bin/python
import sys
import math

from PIL import Image

pixels1 =  Image.open(sys.argv[1]).load() 
pixels2 =  Image.open(sys.argv[2]).load() 

width, height = Image.open(sys.argv[1]).size

all_pixels = []
suma=0
for x in range(width):
    for y in range(height):
        cpixel1 = pixels1[x, y]
        bw_value1 = int(round(sum(cpixel1) / float(len(cpixel1))))
        cpixel2 = pixels2[x, y]
        bw_value2 = int(round(sum(cpixel2) / float(len(cpixel2))))
        suma=suma+(bw_value1-bw_value2)**2
print math.sqrt(suma/(width*height))
