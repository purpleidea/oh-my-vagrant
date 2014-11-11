class p4h::makenewfile($filename = "new_filename", $file_contents = "default contents") {

	file { "/root/${filename}":
		content => "${file_contents}"
    }

    include asecondclass

}
