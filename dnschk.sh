#! /bin/bash

while read line; do
	DNS=`dig NS +short $line`
	if [[  $DNS == *\.wordpress.com* ]]; then
		echo "VIP"
	else
		echo "CLIENT"
	fi
done