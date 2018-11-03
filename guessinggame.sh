#!/bin/bash
#file: guessinggame.sh
digitTest ()
{
  digit_test='^[0-9]+$'
  if ! [[ $answer =~ $digit_test ]]
  then
     echo 0
  else
     echo 1
  fi
}

files_in_dir=`ls -l | wc -l`
let files_in_dir=files_in_dir-1
answer=""

while [ "$answer" != "$files_in_dir" ]
do
  echo "How many files are in the current directory, can you guess?"
  read answer

  if [ -z "$answer" ]
  then
    echo "You must input something"
    continue
  fi

  ret=$(digitTest "$answer")
  if [ $ret -eq 0 ]
  then
    echo "You must innput a number please"
    continue
  fi
  
  if [ $answer -lt $files_in_dir ]
  then
    echo "You guessed too low, please, try to guess again $answer"
  fi
  if [ $answer -gt $files_in_dir ]
  then
    echo "You guessed too high, please, try to guess again, $answer"
  fi
  if [ $answer -eq $files_in_dir ]
  then
    echo "Correct, congratulations!!!"
    sleep 1
  fi
done

exit 0
