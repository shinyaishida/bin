#!/usr/bin/env bash

readonly target=../gauge

test_default_gauge() {
    assert "test '$($target)' == ' + + + + 1 + + + + 2 + + + + 3 + + + + 4 + + + + 5 + + + + 6 + + + + 7 + + + + 8'"
    assert "test '$($target 1)' == '1'"
    assert "test '$($target 2)' == ' 2'"
    assert "test '$($target 3)' == ' +3'"
    assert "test '$($target 4)' == ' + 4'"
    assert "test '$($target 5)' == ' + +5'"
    assert "test '$($target 6)' == ' + + 6'"
    assert "test '$($target 7)' == ' + + +7'"
    assert "test '$($target 8)' == ' + + + 8'"
    assert "test '$($target 9)' == ' + + + +9'"
    assert "test '$($target 10)' == ' + + + + 1'"
    assert "test '$($target 90)' == ' + + + + 1 + + + + 2 + + + + 3 + + + + 4 + + + + 5 + + + + 6 + + + + 7 + + + + 8 + + + + 9'"
}

test_full_gauge() {
    assert "test '$($target -t full)' == '+++++++++1+++++++++2+++++++++3+++++++++4+++++++++5+++++++++6+++++++++7+++++++++8'"
    assert "test '$($target -t full 1)' == '1'"
    assert "test '$($target -t full 2)' == '+2'"
    assert "test '$($target -t full 3)' == '++3'"
    assert "test '$($target -t full 4)' == '+++4'"
    assert "test '$($target -t full 5)' == '++++5'"
    assert "test '$($target -t full 6)' == '+++++6'"
    assert "test '$($target -t full 7)' == '++++++7'"
    assert "test '$($target -t full 8)' == '+++++++8'"
    assert "test '$($target -t full 9)' == '++++++++9'"
    assert "test '$($target -t full 10)' == '+++++++++1'"
    assert "test '$($target -t full 90)' == '+++++++++1+++++++++2+++++++++3+++++++++4+++++++++5+++++++++6+++++++++7+++++++++8+++++++++9'"
}

test_even_gauge() {
    assert "test '$($target -t even)' == ' + + + + 1 + + + + 2 + + + + 3 + + + + 4 + + + + 5 + + + + 6 + + + + 7 + + + + 8'"
    assert "test '$($target -t even 1)' == '1'"
    assert "test '$($target -t even 2)' == ' 2'"
    assert "test '$($target -t even 3)' == ' +3'"
    assert "test '$($target -t even 4)' == ' + 4'"
    assert "test '$($target -t even 5)' == ' + +5'"
    assert "test '$($target -t even 6)' == ' + + 6'"
    assert "test '$($target -t even 7)' == ' + + +7'"
    assert "test '$($target -t even 8)' == ' + + + 8'"
    assert "test '$($target -t even 9)' == ' + + + +9'"
    assert "test '$($target -t even 10)' == ' + + + + 1'"
    assert "test '$($target -t even 90)' == ' + + + + 1 + + + + 2 + + + + 3 + + + + 4 + + + + 5 + + + + 6 + + + + 7 + + + + 8 + + + + 9'"
}

test_five_gauge() {
    assert "test '$($target -t five)' == '    +    1    +    2    +    3    +    4    +    5    +    6    +    7    +    8'"
    assert "test '$($target -t five 1)' == '1'"
    assert "test '$($target -t five 2)' == ' 2'"
    assert "test '$($target -t five 3)' == '  3'"
    assert "test '$($target -t five 4)' == '   4'"
    assert "test '$($target -t five 5)' == '    5'"
    assert "test '$($target -t five 6)' == '    +6'"
    assert "test '$($target -t five 7)' == '    + 7'"
    assert "test '$($target -t five 8)' == '    +  8'"
    assert "test '$($target -t five 9)' == '    +   9'"
    assert "test '$($target -t five 10)' == '    +    1'"
    assert "test '$($target -t five 90)' == '    +    1    +    2    +    3    +    4    +    5    +    6    +    7    +    8    +    9'"
}

test_ten_gauge() {
    assert "test '$($target -t ten)' == '         1         2         3         4         5         6         7         8'"
    assert "test '$($target -t ten 1)' == '1'"
    assert "test '$($target -t ten 2)' == ' 2'"
    assert "test '$($target -t ten 3)' == '  3'"
    assert "test '$($target -t ten 4)' == '   4'"
    assert "test '$($target -t ten 5)' == '    5'"
    assert "test '$($target -t ten 6)' == '     6'"
    assert "test '$($target -t ten 7)' == '      7'"
    assert "test '$($target -t ten 8)' == '       8'"
    assert "test '$($target -t ten 9)' == '        9'"
    assert "test '$($target -t ten 10)' == '         1'"
    assert "test '$($target -t ten 90)' == '         1         2         3         4         5         6         7         8         9'"
}

test_help() {
    local expected
    read -r -d '' expected <<'EOF'
usage:
    gauge [-h] [-t type] [length]
options:
    -t type    gauge type (full, even, five, or ten; even by default)
    -h         print this help
note:
    If 'length' is omitted, the default length (80) is used.
EOF
    assert "test '$($target -h)' = '$expected'"
}

test_zero_gauge() {
    assert "test '$($target 0)' = ''"
}

test_negative_length() {
    assert "test -z '$($target -1)'"
    assert "test '$($target -1 2>&1)' = '$target: illegal option -- 1'"
}
