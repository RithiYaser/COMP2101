#!/bin/bash
#
# this script puts some picture files into a Pictures directory in our home directory
# it does some error testing
# it summarizes the Pictures directory when it is done
#

# Task 1: Improve this script to also retrieve and install the files kept in the https://zonzorp.net/pics.tgz tarfile
#   - use the same kind of testing that is already in the script to only download the tarfile if you don't already have it and  to make sure the download and extraction commands work, then delete the local copy of the tarfile if the extraction was successful

# make a Pictures directory if we don't have one - assumes we have a home directory
test -d ~/Pictures || mkdir ~/Pictures

# download a zipfile of pictures to our Pictures directory if it isn't already there - assumes you are online
test -f ~/Pictures/pics.zip || wget -q -O ~/Pictures/pics.zip http://zonzorp.net/pics.zip

test -f ~/Pictures/pics.tgz || wget -q -O ~/Pictures/pics.tgz https://zonzorp.net/pics.tgz file.
#We first test if pics.tgz file is there in Pictures directory or not. If the test returns false we download the pics.tgz file from the link provided.

# unpack the downloaded zipfile if it is there, then delete the local copy of the zipfile
test -f ~/Pictures/pics.zip && unzip -d ~/Pictures -o -q ~/Pictures/pics.zip && rm ~/Pictures/pics.zip

test -f ~/Pictures/pics.tgz && tar -xvf  ~/Pictures/pics.tgz -C ~/Pictures  && rm ~/Pictures/pics.tgz
#In the same way, we test if pics.tgz is there again and in this we extract the files if the condition is true.
#Finally the pics.tgz is removed if we have successfully extracted the files.

# Make a report on what we have in the Pictures directory
test -d ~/Pictures && cat <<EOF
Found $(find ~/Pictures -type f|wc -l) files in the Pictures directory.
The Pictures directory uses $(du -sh ~/Pictures|awk '{print $1}') space on the disk.
EOF
