#!/bin/bash/

arr=("!" "#")
Counter=0

for char in arr
do
	Temp=0
	Temp=$(grep -o $char testQues1.txt | wc -l)
	Counter=$Counter+$Temp
	echo "The number of special char's occurance is: $char "$counter
done



#We can do this task also with just cmd,

#$(grep -o "#" testQues1.txt | wc -l)

#We can manipulate value after -o flag, cmd will look for exact same match as of -o flag.

