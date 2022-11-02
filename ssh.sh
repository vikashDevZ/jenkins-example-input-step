#!/usr/bin/expect

set USER [lindex $argv ]
set HOST [lindex $argv 1]
set PWD [lindex $argv 2]
log_file /var/log/ssh_tmp.log
set timeout  30
log_user  1
set send_slow {1 .01}
send_log  "Connecting to $HOST using $USER user\n"
eval spawn ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o Connecttimeout =30 "$USER\@$HOST"
expect  {
        timeout       { send_user  "timeout  while connecting to $HOST\n"; exit }
        "*No route to host*" { send_user  "$HOST not reachable\n"; exit }
        "*assword: " { send -s $PWD\r }
        }
expect  {
        timeout  { send_user  "timeout  waiting for prompt\n"; exit }
        "*]#"   { send_user  "Login successful to $HOST\n" }
        }
send "hostname\r"
expect  {
        "*]#"   { send "exit\r" }
        }
send_user  "Disconnected\n"
close