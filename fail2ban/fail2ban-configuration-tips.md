## _fail2ban_ configuration tips

### _TIP#1_: ignoreip
Whitelist your own IP address. This is probably a *no-brainer*.
~~~
file: _/etc/fail2ban/jail.conf_
ignoreip = 127.0.0.1/8 [YOUR IP ADDRESS]
~~~
Retrieve your IP address by running either of these commands on the terminal:
~~~
curl icanhazip.com
curl ifconfig.co
~~~


### _TIP#2_: dbfile
If you don't want to track bans across reboots or service restarts, change dbfile to *None*
~~~
file: _/etc/fail2ban/fail2ban.conf_
dbfile = None
~~~
This change will make fail2ban restarts quicker.\
(**NOTE:** A service restart will *unban* all jailed IPs.)
