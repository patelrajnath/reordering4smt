#	       (c) Centre for Development of Advanced Computing, Mumbai
#	    Knowledge Based Computer Systems Division. All Rights Reserved. 

#!/usr/bin/python
#Created by Raj Nath Patel on Mar 21, 2013
#usage: To compare to files word by word 
#usage: python compare2files.py file1 file2

from itertools import izip
import sys
from decimal import *

if len(sys.argv)!= 3:
        print "usage: python " +sys.argv[0]+ " file1 file2"
        exit(1)

fin1 = open(sys.argv[1])
fin2 = open(sys.argv[2])
match=0
mismatch=0
wordcount =0

for line1, line2 in izip(fin1 , fin2):
        wordsOfLine = line1.split()
        for word1 in wordsOfLine:
		if(word1 in line2):
                        match = match + 1
		else:
			print line1, line2, word1

