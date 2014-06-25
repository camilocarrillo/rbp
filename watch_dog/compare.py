#!/usr/bin/python
import sys
import math

from PIL import Image

h1 = Image.open(sys.argv[1]).histogram()
h2 = Image.open(sys.argv[2]).histogram()
diff_squares = [(h1[i] - h2[i]) ** 2 for i in xrange(len(h1))]; rms = math.sqrt(sum(diff_squares) / len(h1));
print rms
