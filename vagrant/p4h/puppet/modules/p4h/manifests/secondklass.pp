class p4h::secondklass(
  $msg   = 'I am the second class',
  $show  = true
){

  validate_bool($show)

  if $show_msg {
    notify { $msg: }
  }

}
