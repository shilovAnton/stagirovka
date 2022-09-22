#!/bin/bash
for var in $(ls ./test)
do
    if $var = 0
    then
    echo "SUCCESS"
    else
    echo "FAIL"
    fi
done

# if test/tester2.sh = 0
# then
# echo "Tester 2 SUCCESS"
# else
# echo "Tester 2 FAIL"
# fi

# if test/tester3.sh = 0
# then
# echo "Tester 3 SUCCESS"
# else
# echo "Tester 3 FAIL"
# fi
# exit 0