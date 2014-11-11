define p4h::type_b ($file=$file_name) {

  file {"/root/${file}.txt":
    ensure  => file,
    content => "I am writing a file",
  }

}
