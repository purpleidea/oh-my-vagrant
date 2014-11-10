
    define p4h::o_negative ($filename = $title, $content) {
      file {"${filename}":
        ensure  => file,
        content => $content,
      }
    }
