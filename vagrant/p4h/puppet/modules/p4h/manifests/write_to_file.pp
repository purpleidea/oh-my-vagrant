
# vim: ts=8
define p4h::write_to_file ($filename = $title, $content) {
  file {"/tmp/${filename}.plan":
    ensure  => file,
    content => $content,
    mode    => 0644      }
}
