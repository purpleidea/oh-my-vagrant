    define p4h::b_positive ($dir = $title) {
      file {$dir:
        ensure  => "directory",
      }
    }
