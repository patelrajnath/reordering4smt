#	       (c) Centre for Development of Advanced Computing, Mumbai
#	    Knowledge Based Computer Systems Division. All Rights Reserved. 

#!/bin/bash
#Created by Raj Nath Patel on Mar 21, 2013

WORKDIR=`dirname $0`

if [ $# != 1 ]
then
	echo "Usage: $0 inputfile "
	exit 1
else
	sh $WORKDIR/lexparser.sh $1 |tee $1.parsed
	echo "runstanfordparser.sh: output file @ $1.parsed"
	echo "Have a nice day !"
fi
