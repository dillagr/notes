## _fail2ban_ Configuration Tips
fail2ban will work out-of-the-box even without these modifications.

### _TIP #1_: ignoreip
Whitelist your own IP address. This is probably a *no-brainer*.
~~~
file: /etc/fail2ban/jail.conf
ignoreip = 127.0.0.1/8 [YOUR IP ADDRESS]
~~~
Retrieve your IP address by running either of these commands on the terminal:
~~~
curl icanhazip.com
curl ifconfig.co
~~~


### _TIP #2_: dbfile
If you don't want to track bans across reboots or service restarts, change dbfile to *None*
~~~
file: /etc/fail2ban/fail2ban.conf
dbfile = None
~~~
This change will make fail2ban restarts quicker.\
(**NOTE:** A service restart will *unban* all jailed IPs.)
