setup() {
  load 'test_helper/common-setup'
  _common_setup
}

@test 'can run and' {
  and
}

@test 'run with an argument' {
  run and 0
  assert_output '0'
}

@test 'run with two arguments' {
  run and 0 1
  assert_output '0 and 1'
}

@test 'run with three arguments' {
  run and 0 1 2
  assert_output '0, 1, and 2'
}

@test 'run with quoted arguments' {
  run and '0 and 1' 2 3
  assert_output '0, and, 1, 2, and 3'
  run and '0, 1, 2, and 3' 4 5
  assert_output '0,, 1,, 2,, and, 3, 4, and 5'
}
