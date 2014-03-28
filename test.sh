#!/bin/sh

ruby lambda_cat.rb test | ruby | ( cat test | diff -u /dev/fd/3 -) 3<&0

if test $? -eq 0; then
	echo 'success'
	return 0
else
	echo 'failure'
	return 1
fi

