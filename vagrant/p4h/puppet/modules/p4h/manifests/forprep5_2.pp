class p4h::forprep5_2(
  $passed_param = 'default',
  $passed_param2 = 'default'
  ) {
  file { '/root/forprep5_2':
    content => "forprep5_2 contents: $passed_param and $passed_param2"
  }
}