
define repo_product ($product = $title) {
    
    file { '/root/product_${title}.txt':
            content => 'nothing yet' }

}
