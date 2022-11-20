#!/usr/bin/env bash

readonly target=../ord

test_ordinal_number() {
    assert "test '$($target 0)' = '0th'"
    assert "test '$($target 1)' = '1st'"
    assert "test '$($target 2)' = '2nd'"
    assert "test '$($target 3)' = '3rd'"
    assert "test '$($target 4)' = '4th'"
    assert "test '$($target 5)' = '5th'"
    assert "test '$($target 6)' = '6th'"
    assert "test '$($target 7)' = '7th'"
    assert "test '$($target 8)' = '8th'"
    assert "test '$($target 9)' = '9th'"
    assert "test '$($target 10)' = '10th'"
    assert "test '$($target 11)' = '11th'"
    assert "test '$($target 12)' = '12th'"
    assert "test '$($target 13)' = '13th'"
    assert "test '$($target 14)' = '14th'"
    assert "test '$($target 15)' = '15th'"
    assert "test '$($target 16)' = '16th'"
    assert "test '$($target 17)' = '17th'"
    assert "test '$($target 18)' = '18th'"
    assert "test '$($target 19)' = '19th'"
    assert "test '$($target 20)' = '20th'"
    assert "test '$($target 21)' = '21st'"
    assert "test '$($target 22)' = '22nd'"
    assert "test '$($target 23)' = '23rd'"
    assert "test '$($target 24)' = '24th'"
}

test_negative_ordinal_number() {
    assert "test '$($target -1)' = '-1th'"
    assert "test '$($target -2)' = '-2th'"
    assert "test '$($target -3)' = '-3th'"
    assert "test '$($target -4)' = '-4th'"
}

test_no_input() {
    assert "test -z '$($target)'"
}

test_char_input() {
    assert "test '$($target a)' = 'a'"
}

test_ordinal_numbers() {
    assert "test '$($target 0 1 2 3 4)' = '0th 1st 2nd 3rd 4th'"
}
