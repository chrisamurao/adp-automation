#! /bin/bash

#read the amount of checks in the batch
#maybe add web parser for these steps -> beautiful soup-ish or roll own
echo "Enter amount of checks in the batch:"
read checks

#read the amount of checkitems in the batch
echo "Enter amount of checks items in the batch:"
read check_items

# find the amount of these things
p_one=$(grep -o "P04025001TB" $1 | wc -l)
echo "P04025001TB: $p_one"

p_two=$(grep -o "P040" $1 | wc -l)
echo "P040: $p_two"

p_three=$(grep -o "P041" $1 | wc -l)
echo "P041: $p_three"

p_four=$(grep -o "P042" $1 | wc -l)
echo "P042: $p_four"


# Add the number of p040, p041, and p042 records 
added=$(($p_two + $p_three + $p_four))
echo "Total number of records: $added" 

# subtract the number of check items from this count and divide by 8, the result should match the number of checks in the batch
subtracted=$(($added-$check_items))

echo "Subtracted: $subtracted"
# echo $(($subtracted / 8 ))
# divided=$(python -c "print float($subtracted) // 8")
echo $divided

# if [[ $(($divided-$check_items)) = $checks ]]
if [[ $(($subtracted / 8)) = $checks ]]
then
  echo "OK"
else
  echo "NOT OK"
fi
