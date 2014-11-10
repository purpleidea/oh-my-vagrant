define p4h::prep7_foo ($filename, $user = $title, $content) {
      file {"/home/${user}/${filename}":
        ensure  => file,
        content => $content,
        mode    => 0644,
        owner   => $user,
      }
    }