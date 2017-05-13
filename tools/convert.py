#	       (c) Centre for Development of Advanced Computing, Mumbai
#	    Knowledge Based Computer Systems Division. All Rights Reserved. 

#! usr/bin/python
import sys

#Open a file
if len(sys.argv)!=2: 
	print "Usase: python"+argv[0]+' parsed-file'
	sys.exit(1)

fr1=sys.argv[1]
inputfile=fr1+'.parsed'
outputfile=fr1+'.stanford.parsed'

fr=open(inputfile,'r')
fout =open(outputfile,'w')

for line in fr:
	line=line[+6:-2]+'\n'
	fout.write(line)

fout.close()
fr.close()
