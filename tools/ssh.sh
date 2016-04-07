#!/usr/bin/expect
spawn rsync -v GateServerD root@115.159.103.184:/tmp/server
expect {
        "(yes/no)" { send "yes\n";exp_continue }
        "password:" { send "topform@2107\n" }
}
expect "total" ;
expect eof;
send_user "file send success!\n";
