#!/bin/sh

check_executed()
{
	if test $1 -eq 0; then
		return 0
	else
		echo 'failure'
		exit 1
	fi
}

ruby lambda_cat.rb test.txt | ruby | ( cat test.txt | diff -u /dev/fd/3 -) 3<&0
check_executed $?

ruby lambda_cat.rb lambda_cat.rb | ruby | ruby - lambda_cat.rb | ruby | ruby - test.txt | ruby | ( cat test.txt | diff -u /dev/fd/3 -) 3<&0
check_executed $?

echo 'success'

