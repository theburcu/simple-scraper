#!/bin/bash

# above line is important because we must specify the interpreter
# this little script is an example on how to use basic Linux capabilities on simple web crawling

if [[ -z $1 ]]
then
 echo "ERROR: No search string supplied."
 echo "USAGE: ./scriptname.sh <search srting>"
else
 searchingobject=$1
fi


URL="http://www.google.com/search?q="
PARAMETER=`echo $searchingobject | sed 's/ /+/g'`
URI="$URL$PARAMETER&tbm=nws&tbs=qdr:h&hl=en&safe=off"


wget --user-agent="Mozilla" -O - $URI > output.html



perl -0777 -pe 's/<script.*?script>//gs' output.html | perl -0777 -pe 's/<style.*?style>//gs' > output1.txt

pup 'div[class*="BNeawe"] text{}' < output1.txt > output2.txt
