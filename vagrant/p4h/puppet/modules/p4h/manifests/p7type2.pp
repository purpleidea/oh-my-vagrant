
define p4h::p7type2 ($message) {

    notify { "type2_message_${name}":
        message => "Type 2 message: ${message}"
    }

}