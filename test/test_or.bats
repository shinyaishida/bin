setup() {
  load 'test_helper/common-setup'
  _common_setup
}

@test 'can run or' {
  or
}

@test 'run with an argument' {
  run or 0
  assert_output '0'
}

@test 'run with two arguments' {
  run or 0 1
  assert_output '0 or 1'
}

@test 'run with three arguments' {
  run or 0 1 2
  assert_output '0, 1, or 2'
}

@test 'run with quoted arguments' {
  run or '0 or 1' 2 3
  assert_output '0, or, 1, 2, or 3'
  run or '0, 1, 2, or 3' 4 5
  assert_output '0,, 1,, 2,, or, 3, 4, or 5'
}
