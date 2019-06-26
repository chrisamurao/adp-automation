#! /bin/bash

#load config
. ./counter.config

if [[ $1 -eq 0 ]];
then
  echo "No file to analyze."
  echo -e "Select file: using dir ${YELLOW}${PATHTOTXTFILE}${NC}"
  ls -la ${PATHTOTXTFILE}
  read f
  set -- "$f"
  echo $1
fi

if [[ $1 -eq 0 ]];
then
  exit 1
fi

echo -e "Analyzing file: ${GREEN}$1${NC}"

# find the amount of these things
echo -e "${CYAN}Finding amounts...${NC}"
p_one=$(grep -o "P04025001TB" $1 | wc -l)
echo -e "P04025001TB: $p_one"

p_two=$(grep -o "P040" $1 | wc -l)
echo "P040: $p_two"

p_three=$(grep -o "P041" $1 | wc -l)
echo "P041: $p_three"

p_four=$(grep -o "P042" $1 | wc -l)
echo "P042: $p_four"

# Add the number of p040, p041, and p042 records 
added=$(($p_two + $p_three + $p_four))
echo "Total number of records: $added" 
echo
#read amounts
#maybe add web parser for these steps -> beautiful soup-ish or roll own
#curl ...
read -p "Enter amount of checks in the batch: >>>>>> " checks
read -p "Enter amount of check items in the batch: >>>>>> " check_items
echo
# subtract the number of check items from this count and divide by 8, the result should match the number of checks in the batch
echo -e "${CYAN}Checking math...${NC}"
subtracted=$(($added-$check_items))
echo -e "Subtracted: sum(P04*) - checkitems: ${RED}$subtracted${NC}"

if [[ $(($subtracted % 8)) != 0 ]];
then
  echo -e "${RED}Math failed (Division by 8), mod = $(($subtracted % 8)). Exiting...${NC}"
  exit
else
  echo -e "${GREEN}Division by 8 OK${NC}"
fi

echo "Number of checks: $checks"
echo -e "subtracted / 8: $(($subtracted / 8 ))"
if [[ $(($subtracted / 8 )) = $checks ]];
then
  echo -e "${GREEN}MATH OK${NC}"
else
  echo -e "${RED}MATH NOT OK${NC}"
fi