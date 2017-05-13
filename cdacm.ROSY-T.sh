#	       (c) Centre for Development of Advanced Computing, Mumbai
#	    Knowledge Based Computer Systems Division. All Rights Reserved. 

#!/bin/sh
#Created by Raj Nath Patel on Mar 21, 2013

WORKDIR=`dirname $0`

if [ $# != 1 ]
then
	echo "Usage: $0 inputfile"
	exit 1
else

	path=$(dirname $1)
	echo "PATH = $path"
	filename=$(basename $1)
	echo "FILENAME = $filename"
	base="${filename%.*}"
	echo "BASE = $base"
	ext="${filename##*.}"
	echo "EXT = $ext"
	
	mkdir -p $WORKDIR/tmp
	cp $1 $WORKDIR/tmp
	sh $WORKDIR/tools/runstanfordparser.sh $WORKDIR/tmp/$filename
	python $WORKDIR/tools/convert.py  $WORKDIR/tmp/$filename
	perl $WORKDIR/tools/cdacm-reorder-V1.0.pl $WORKDIR/tools  $WORKDIR/tmp/$filename.stanford.parsed >  $WORKDIR/tmp/$filename.reo 2>  $WORKDIR/tmp/$filename.err.log &

	echo "Reordering started..."
	for job in `jobs -p`
	do
		while kill -0 $job >/dev/null 2>&1
		do
			echo -n '.'
			sleep 3
		done
	done

	cat  $WORKDIR/tmp/$filename.reo |tr -s ' ' >  $WORKDIR/tmp/$filename.reo.clean
	sed 's/^ //' < $WORKDIR/tmp/$filename.reo.clean > $path/$base.reordered.$ext		
	#rm -rf $1.*
	echo -e "\nCheers!"
fi
