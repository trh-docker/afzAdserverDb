#!/bin/bash
tlmuser init
ads init
tlmuser rootuser
afzas adduser --username $COCKROACH_USER
cat adserver.yml
sleep 2


adfree init
echo 'Init Done'
adfree wild
echo 'Wild Domains Done'
adfree sauces
echo 'Special Sauce Done'
#adfree adlist
#echo 'Special Advert List Done'

adserverdb drop
adserverdb init

echo 'Init DB done'
cat adserver.yml



