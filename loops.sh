#!/bin/bash

# Basic while loop
counter=1
while [ $counter -le 10 ]
do
echo $counter
((counter++))
done
echo All done

# Basic until loop
counter=1
until [ $counter -gt 10 ]
do
echo $counter
((counter++))
done
echo All done

# Basic for loop
names='Stan Kyle Cartman'
for name in $names
do
echo $name
done
echo All done

# Basic range in for loop
for value in {1..5}
do
echo $value
done
echo All done

# Basic range with steps for loop
for value in {10..0..2}
do
echo $value
done
echo All done

# Make a backup set of files with break
for value in $1/*
do
used=$( df $1 | tail -1 | awk '{ print $5 }' | sed 's/%//' )
if [ $used -gt 90 ]
then
echo Low disk space 1>&2
break
fi
cp $value $1/backup/
done

# Make a backup set of files with continue
for value in $1/*
do
if [ ! -r $value ]
then
echo $value not readable 1>&2
continue
fi
cp $value $1/backup/
done