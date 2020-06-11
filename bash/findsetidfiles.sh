#!/bin/bash
#!/bin/bash
#
# this script generates a report of the files on the system that have the setuid permission bit turned on
# it is for the lab1 exercise
# it uses the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files are sorted by their owner

# Task 1 for the exercise is to modify it to also find and display the setgid files in a second listing
# The second listing should display after the setuid file list, and be formatted similar to the
# setuid file list including having a title
# use the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files should be sorted by their group

# Task 2 for the exercise is to modify it to also display the 10 largest regular files in the system, sorted by their sizes
# The listing should only have the file name, owner, and size in MBytes and be displayed after the listings of
# setuid and setgid files and should have its own title
# use the find command to generate the list of files with their sizes, with an error redirect to /dev/null
# use cut or awk to display only the output desired
echo "Setuid files:"
echo "============="
find / -type f -executable -perm -4000 -ls 2>/dev/null | sort -k 3
echo""
##############################################################################
echo "Setgid files:"
echo "============="
find / -type f -executable -perm -2000 -ls 2>/dev/null | sort -k 6
echo""
#Permission for setgig is 2000
#We sort by 6th column as we have to sort the identified files by group
#2>/dev/null redirects the errors
##############################################################################
echo "10 largest files:"
echo "============="
find / 2>/dev/null  -type f -exec ls -alh --block-size=M {} +| sort -hr -k5 | head|awk '{print $3,$5,$9}'
echo""
#--block-size=M ensures that the size is shown in Mbytes.
#sort -hr is to show the files in reverse order. When I tired putting just sort -h, somehow it just shows the smallest files. So I reversed the order to get largest files.
#Head automatically just gives top 10 results. So didn't have to modify it.
#awk {print $3,$5,$9} removes every detail except coloumn 3,5 and 9
###############################################################################
