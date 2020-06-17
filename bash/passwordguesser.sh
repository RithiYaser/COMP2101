#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same
# it also demonstrates using conditional execution

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data (i.e. TestString)
# TASK 2: Improve it by rewriting it to use the if command
#         The if command should test if they got it right, in which case it should tell them they got it right
#         The if command should tell them they got it wrong
# TASK 3: Improve it by giving them 5 tries to get it right before failing
#           *** Do not use the exit command, and do not use a loop (e.g. while or for)

echo "Enter your password guess"
read myString
#We have asked the user to enter their guess and assigned the text to a variable called myString.

referenceString="password"

#if [ $myString = $referenceString ]; then
#  echo "Correct!"
#else
#  echo "Incorrect."
#fi
#This is the commands for TASK 2. FIrst we check if both the strings are same. If it is same we say its correct or we show the message Incorrect


#TASK 3
if [ $myString = $referenceString ]; then
  echo "Correct! You got it right the very first time"  #If the guess is same as the password we say it is correct.
else echo "The password you guessed is wrong. You have 4 more attempts." #This works if the if command is not true
  read myString
  if [ $myString = $referenceString ]; then #We take a new input into myString and then compares it again
    echo "You got it right in your second attempt!"
  else echo "The password you guessed is wrong. You have 3 more attempts." #If the second comparison also fails, this else works. It also tells the user how many chances they have left.
    read myString
    if [ $myString = $referenceString ]; then
      echo "You got it right in your third attempt!"
    else echo "The password you guessed is wrong. You have 2 more attempts."
      read myString
      if [ $myString = $referenceString ]; then
        echo "You got it right in your fourth attempt!"
      else echo "The password you guessed is wrong. You have just 1 more attempt left."
        read myString
        if [ $myString = $referenceString ]; then #All these are the same commands as above that is written to give the user 5 chances.
        echo "You finally got it right!"
      else echo "Your chances are over. You are very bad at guessing" #If the user fails to guess it at the 5th chance, their chances are over.
        fi
      fi
    fi
  fi
fi
#Since we used 5 if loops, we have to close them all with fi. So we close all of them one by one and with the final fi, we exit the loop completely.
