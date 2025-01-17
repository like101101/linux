#! /bin/bash

#Name of File where QEMU output is stored
test_output="test.out"

#Remove old object Files
rm unit_test.o
rm ../unit_test.o

#Make test
make boot_test

#Build Test as UKL Application
make unit_test

#Run boot test
cd ../
cd ../
make runU -C min-initrd

#Check for Magic String to Verify that UKL Booted
#If Test fails, print QEMU output
if ! grep -sq "UKL Booted Successfully" "$test_output"; then
    echo "TEST FAIL - UKL BOOT"
    cat $test_output
    rm -f $test_output
    exit 1
fi

#Otherwise, print success message
echo "TEST PASS - UKL BOOT"

rm -f $test_output

exit 0
