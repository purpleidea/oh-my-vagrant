class p4h::forprep5() {
  class {'p4h::forprep5_2':
    passed_param  => 'test',
    passed_param2 => 'test2'
  }

  file { '/root/forprep5':
    content => "forprep5 contents"
  }
}