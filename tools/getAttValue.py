#	       (c) Centre for Development of Advanced Computing, Mumbai
#	    Knowledge Based Computer Systems Division. All Rights Reserved. 

#!/usr/bin/python
#Created by Raj Nath Patel on Mar 21, 2013

#import deepcopy
from lxml import etree
import sys
import codecs


if (len(sys.argv)!= 2):
        print 'Usase : python '+sys.argv[0]+' file.XML'
        exit(0)

inputfile1 = sys.argv[1]
outputfile = sys.argv[1]+'.sent.txt' 

fout = open(outputfile , 'w')

doc1 = etree.parse(inputfile1)
root = doc1.getroot()

#Change the nodes according to your xml input file
sent_list = root.xpath('//Anuvadaksh-Consortia/Body/Input-Text/Input')

for sent in sent_list:
	content = sent.text
	content = content.strip()
	print content
	fout.write(content+'\n')	
