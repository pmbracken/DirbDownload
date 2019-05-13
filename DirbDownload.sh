#!/bin/bash

## Defines date/timestamp
timestamp=$(date "+%Y-%m-%d--%H:%M:%S")

##takes input of address
echo "enter site address/URL"
read webaddress && echo ""

##makes and changes directory to the name of the website
mkdir "$webaddress--$timestamp" && cd "$webaddress--$timestamp" && echo "!!mkdir & cd complete!!" && echo ""

##perform dirb on address and output to webaddress.txt
dirb http://$webaddress /root/Desktop/wordlisttest -o $webaddress.txt > /dev/null 
echo "!!dirb Complete!!" && echo ""


## print web address file and grep out found entry taking input from directoriesfound.txt
cat $webaddress.txt | grep "==>" | cut -d" " -f 3 > dirFound.txt 
echo "!!printout dirfound complete!!" && echo ""

#read line by line of  dirFound.txt and downloads each file/directory and changes dir to it
wget -r -i dirFound.txt > /dev/null 2>&1 && echo "!!wget complete!!" && echo ""

cd $webaddress

