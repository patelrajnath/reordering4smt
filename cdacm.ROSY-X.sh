#	       (c) Centre for Development of Advanced Computing, Mumbai
#	    Knowledge Based Computer Systems Division. All Rights Reserved. 

#!/bin/bash
#created by Raj Nath Patel on Mar 21, 2013

WORKDIR=`dirname $0`

if [ $# != 1 ]
then
	echo "Usage: $0 input-xmlfile"
	exit 1
else
	python $WORKDIR/tools/getAttValue.py $1
	bash $WORKDIR/cdacm.ROSY-T.sh $1.sent.txt
	python $WORKDIR/tools/changeAtt.py $1 $1.sent.reordered.txt
        rm $1.*
fi
