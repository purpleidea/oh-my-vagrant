
define p4h::repo_product ($product = $title, $repo) {
    
    file { "/root/product_${product}.txt":
            content => 'cam from repo ${repo}',
            #require => Package['yum'],
    }

}
