#! /bin/bash

#read the amount of checks in the batch

#read the amount of checkitems in the batch


# find the amount of these things
grep P04025001TB $1 | wc -l 
grep hello $1 | wc -l
# find the amount of other things
grep P040 $1 | wc -l

grep P041 $1 | wc -l

grep P042 $1 | wc -l
