#!bin/bash
start_num=$1
end_num=$2
cat /dev/null > inputFile
for ((i=${start_num};i<=${end_num};i++)); do
  rand_num=$RANDOM
  echo "$i, $rand_num" >>inputFile
done
