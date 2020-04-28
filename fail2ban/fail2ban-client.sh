#!/bin/bash
## PRINT FAIL2BAN STATUS
## desitnation: /etc/profile.d/fail2ban-client.sh

F2BCMD=$(sudo -l /usr/bin/fail2ban-client)

if [[ $F2BCMD == /usr/bin/fail2ban-client ]] ; then
    sudo /usr/bin/fail2ban-client status sshd
fi

echo
