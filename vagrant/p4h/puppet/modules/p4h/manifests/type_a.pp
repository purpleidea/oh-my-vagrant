define p4h::type_a ($file=$file_name) {

  file {"/root/${file}.txt":
    ensure  => file,
    content => "I am writing a file",
  }

}
