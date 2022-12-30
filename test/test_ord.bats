setup() {
  load 'test_helper/common-setup'
  _common_setup
}

@test 'can run ord' {
  ord
}

@test 'run with a number' {
  patterns=( \
    '0:0th' '1:1st' '2:2nd' '3:3rd' '4:4th' '5:5th' '7:7th' '8:8th' '9:9th' \
    '10:10th' '11:11th' '12:12th' '13:13th' '14:14th' '15:15th' '16:16th' \
    '17:17th' '18:18th' '19:19th' '20:20th' '21:21st' '22:22nd' '23:23rd' \
    '24:24th' \
  )
  for pattern in "${patterns[@]}"; do
    run ord "${pattern%%:*}"
    assert_output "${pattern##*:}"
  done
}

@test 'run with a negative number' {
  patterns=('-1:-1th' '-2:-2th' '-3:-3th' '-4:-4th')
  for pattern in "${patterns[@]}"; do
    run ord "${pattern%%:*}"
    assert_output "${pattern##*:}"
  done
}

@test 'run with no arguments' {
  run ord
  assert_output ''
}

@test 'run with arguments' {
  run ord 0 1 2 3 4
  assert_output '0th 1st 2nd 3rd 4th'
}
