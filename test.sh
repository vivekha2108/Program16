#!/bin/bash

echo "=========================================="
echo " PL/SQL FOR LOOP AUTOGRADING"
echo "=========================================="

FILE="answers.sql"

# Check answers.sql
if [ ! -f "$FILE" ]; then
    echo "FAIL: answers.sql not found."
    exit 1
fi

echo "PASS: answers.sql found."

CONTENT=$(cat "$FILE" | tr '[:upper:]' '[:lower:]')

# Test 1: SERVEROUTPUT
if echo "$CONTENT" | grep -q "set serveroutput on"; then
    echo "PASS: SET SERVEROUTPUT ON found."
else
    echo "FAIL: SET SERVEROUTPUT ON not found."
    exit 1
fi

# Test 2: BEGIN
if echo "$CONTENT" | grep -q "begin"; then
    echo "PASS: BEGIN found."
else
    echo "FAIL: BEGIN not found."
    exit 1
fi

# Test 3: FOR LOOP
if echo "$CONTENT" | grep -q "for"; then
    echo "PASS: FOR loop found."
else
    echo "FAIL: FOR loop not found."
    exit 1
fi

# Test 4: Range 1..10
if echo "$CONTENT" | grep -Eq "1[[:space:]]*\.\.[[:space:]]*10"; then
    echo "PASS: FOR LOOP range 1..10 found."
else
    echo "FAIL: FOR LOOP range 1..10 not found."
    exit 1
fi

# Test 5: LOOP keyword
if echo "$CONTENT" | grep -q "loop"; then
    echo "PASS: LOOP keyword found."
else
    echo "FAIL: LOOP keyword not found."
    exit 1
fi

# Test 6: END LOOP
if echo "$CONTENT" | grep -Eq "end[[:space:]]+loop"; then
    echo "PASS: END LOOP found."
else
    echo "FAIL: END LOOP not found."
    exit 1
fi

# Test 7: DBMS_OUTPUT.PUT_LINE
if echo "$CONTENT" | grep -q "dbms_output.put_line"; then
    echo "PASS: DBMS_OUTPUT.PUT_LINE found."
else
    echo "FAIL: DBMS_OUTPUT.PUT_LINE not found."
    exit 1
fi

# Test 8: END
if echo "$CONTENT" | grep -q "end;"; then
    echo "PASS: END statement found."
else
    echo "FAIL: END statement not found."
    exit 1
fi

echo ""
echo "=========================================="
echo " ALL TESTS PASSED"
echo "=========================================="

exit 0
