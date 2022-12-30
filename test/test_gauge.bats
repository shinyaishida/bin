setup() {
  load 'test_helper/common-setup'
  _common_setup
}

@test 'can run gauge' {
  gauge
}

@test 'run gauge of default type' {
  parameters=( \
    ': + + + + 1 + + + + 2 + + + + 3 + + + + 4 + + + + 5 + + + + 6 + + + + 7 + + + + 8' \
    '1:1' \
    '2: 2' \
    '3: +3' \
    '4: + 4' \
    '5: + +5' \
    '6: + + 6' \
    '7: + + +7' \
    '8: + + + 8' \
    '9: + + + +9' \
    '10: + + + + 1' \
    '90: + + + + 1 + + + + 2 + + + + 3 + + + + 4 + + + + 5 + + + + 6 + + + + 7 + + + + 8 + + + + 9' \
  )
  for pattern in "${patterns[@]}"; do 
    run gauge "${pattern%%:*}"
    assert_output "${pattern##*:}"
  done
}

@test 'run gauge of full type' {
  parameters=( \
    ':+++++++++1+++++++++2+++++++++3+++++++++4+++++++++5+++++++++6+++++++++7+++++++++8' \
    '1:1' \
    '2:+2' \
    '3:++3' \
    '4:+++4' \
    '5:++++5' \
    '6:+++++6' \
    '7:++++++7' \
    '8:+++++++8' \
    '9:++++++++9' \
    '10:+++++++++1' \
    '90:+++++++++1+++++++++2+++++++++3+++++++++4+++++++++5+++++++++6+++++++++7+++++++++8+++++++++9' \
  )
  for pattern in "${patterns[@]}"; do 
    run gauge -t full "${pattern%%:*}"
    assert_output "${pattern##*:}"
  done
}

@test 'run gauge of even type' {
  parameters=( \
    ': + + + + 1 + + + + 2 + + + + 3 + + + + 4 + + + + 5 + + + + 6 + + + + 7 + + + + 8' \
    '1:1' \
    '2: 2' \
    '3: +3' \
    '4: + 4' \
    '5: + +5' \
    '6: + + 6' \
    '7: + + +7' \
    '8: + + + 8' \
    '9: + + + +9' \
    '10: + + + + 1' \
    '90: + + + + 1 + + + + 2 + + + + 3 + + + + 4 + + + + 5 + + + + 6 + + + + 7 + + + + 8 + + + + 9' \
  )
  for pattern in "${patterns[@]}"; do 
    run gauge -t even "${pattern%%:*}"
    assert_output "${pattern##*:}"
  done
}

@test 'run gauge of five type' {
  parameters=( \
    ':    +    1    +    2    +    3    +    4    +    5    +    6    +    7    +    8' \ 
    '1:1' \
    '2: 2' \
    '3:  3' \
    '4:   4' \
    '5:    5' \
    '6:    +6' \
    '7:    + 7' \
    '8:    +  8' \
    '9:    +   9' \
    '10:    +    1' \
    '90:    +    1    +    2    +    3    +    4    +    5    +    6    +    7    +    8    +    9' \
  )
  for pattern in "${patterns[@]}"; do 
    run gauge -t five "${pattern%%:*}"
    assert_output "${pattern##*:}"
  done
}

@test 'run gauge of ten type' {
  parameters=( \
    ':         1         2         3         4         5         6         7         8' \ 
    '1:1' \
    '2: 2' \
    '3:  3' \
    '4:   4' \
    '5:    5' \
    '6:     6' \
    '7:      7' \
    '8:       8' \
    '9:        9' \
    '10:         1' \
    '90:         1         2         3         4         5         6         7         8         9' \
  )
  for pattern in "${patterns[@]}"; do 
    run gauge -t ten "${pattern%%:*}"
    assert_output "${pattern##*:}"
  done
}

@test 'print help' {
  expected=$(cat <<'EOF'
usage:
    gauge [-h] [-t type] [length]
options:
    -t type    gauge type (full, even, five, or ten; even by default)
    -h         print this help
note:
    If 'length' is omitted, the default length (80) is used.
EOF
  )
  run gauge -h
  assert_output "$expected"
}

@test 'run gauge with 0' {
  run gauge 0
  assert_output ''
}

@test 'run gauge with a negative number' {
  run gauge -1
  assert_output "${PROJECT_ROOT}/gauge: illegal option -- 1"
}
