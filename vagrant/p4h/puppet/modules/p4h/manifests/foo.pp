class p4h::foo(
    $filename = 'foo',
    $value    = 'somevalue'
) {

   file {"/etc/${filename}":
         content => "FOOFoOFOO: ${somevalue} in ${filename}",
   } 
   class { 'p4h::bar': }
}
