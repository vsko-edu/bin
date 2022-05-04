#!/bin/sh
#
# This file is in the public domain.
# Test the CSV utilities using the files test.csv and test.out.
# Output of the tests will be sent to result.txt.
#
# For more information email LoranceStinson+csv@gmail.com.

# Make sure the necessary files exist.
[ ! -r "test.csv" -o ! -r "test.out" ] &&
    echo "test.csv and test.out must be present." && exit 1;

# Run the tests.

# A compelxt test of csv2csv.
./csv2csv test.csv -E '\' -Q "'" -S ";" -T "TAB" -N "NL" -n 5 \
    > result.txt 2>&1
echo "" >> result.txt

# Convert test.csv twice. This will test all of the command line options.
./csv2csv test.csv -E '\' -Q "'" -S ";" -T "TAB" -N "NL" -n 5 |\
    ./csv2csv -e '\' -q "'" -s ';' -r 1 -l 3 >> result.txt 2>&1
echo "" >> result.txt

# Convert test.csv to HTML with no options.
./csv2html test.csv >> result.txt 2>&1
echo "" >> result.txt

# Convert test.csv to HTML with all options.
./csv2html test.csv -A -b -c '<FONT face="Arial">%s</FONT>' -C "nowrap" \
    -E "SPACE" -f -F -H -i -I '	' -N "NL" -n 5 -r 1 -R 'valign="middle"' \
    -t 'This is the HTML title' -T 'border="0" algn="center"' \
    >> result.txt 2>&1
echo "" >> result.txt

# Convert test.csv into a sc spreadsheet file.
./csv2sc test.csv -N ' NL ' -T ' TAB ' >> result.txt 2>&1
echo "" >> result.txt

# Convert test.csv into SQL.
./csv2sql test.csv -N ' NL ' -T ' TAB ' >> result.txt 2>&1
echo "" >> result.txt

# See if the test passed.
diff test.out result.txt > /dev/null 2>&1
[ $? != 0 ] &&
    echo "Test failed." &&
    echo "Please email LoranceStinson+csv@gmail.com the following:" &&
    echo "1) The contents of result.txt." &&
    echo "2) The operating system you are using" &&
    echo "3) The version of awk and sh you are using. " &&
    echo "" && exit;

echo "Test passed. Everything looks good."
