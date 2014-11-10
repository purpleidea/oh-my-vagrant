
class prep6thing::example() {

    $my_template_res = template('prep6thing/prep6template.erb')
    
    notify { "$my_template_res": }
    if ($my_template_res =~ /prep6/) {

        file { '/root/prep6template_render.txt':
                content => $my_template_res
        }
    } else {
        file { '/root/prep6template_render_game_over_man.txt':
                content => "thats just your opinion dude. your not even prep6 ${my_template_res}"
        }
        # foo
    }
}
