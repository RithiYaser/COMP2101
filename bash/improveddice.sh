#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls
#

# Task 1:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or minimum value for the generated number in another variable
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias

# Task 2:
#  generate the sum of the dice
#  generate the average of the dice

#  display a summary of what was rolled, and what the results of your arithmetic were

# Tell the user we have started processing
echo "Rolling..."

#We assigned the number of sides and the minimum value of generated numbers to the variables range and bias respectively.
range=6
bias=1

# roll the dice and save the results
die1=$(( RANDOM % $range + $bias ))
die2=$(( RANDOM % $range + $bias ))
#Replaced the numbers 6 and 1 with the variable we created

#We are creating a variable called sum to store the sum of the two dice Rolled
sum=$(( die1 + die2 ))

#Now we create the variable avg and stores the average of the two dice Rolled
avg=$(( sum / 2 ))

# display the results
echo "Rolled $die1, $die2.
The sum of the rolls was $sum and the average was $avg.
"
#Modified the text to show both sum and average along with the previous output.
