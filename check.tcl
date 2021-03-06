#! /usr/bin/env expect

# This script checks if the inbox is valid on the server.
# Credit to https://github.com/amaurymartiny/check-if-email-exists/blob/master/expectTelnet.tcl

# Retrive arguments
set email   [lindex $argv 0]
set host    [lindex $argv 1]
set port    [lindex $argv 2]
set sender  [lindex $argv 3]

# Start a Telnet communication
spawn telnet $host $port;
expect  "220"
send    "HELO Hi\r";
expect  "250"
send    "MAIL FROM: <$sender>\r";
expect  "250"
send    "RCPT TO: <$email>\r";
expect  "*"
send    "QUIT\r"
expect  eof