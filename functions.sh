#!/bin/bash

# Setting a return status for a function
print_something () {
echo Hello $1
return 5
}
print_something Mars
print_something Jupiter
echo The previous function has a return value of $?

# Setting a return value to a function
lines_in_file () {
cat $1 | wc -l
}
num_lines=$( lines_in_file $1 )
echo The file $1 has $num_lines lines in it.

# Experimenting with variable scope
var_change () {
local var1='local 1'
echo Inside function: var1 is $var1 : var2 is $var2
var1='changed again'
var2='2 changed again'
}
var1='global 1'
var2='global 2'
echo Before function call: var1 is $var1 : var2 is $var2
var_change
echo After function call: var1 is $var1 : var2 is $var2

# OverWrite a command Create a wrapper around the command ls
ls () {
command ls -lh
}
ls