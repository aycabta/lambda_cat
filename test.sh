#!/bin/sh

ruby lambda_cat.rb test | ruby | ( cat test | diff /dev/fd/3 -) 3<&0

