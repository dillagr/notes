## _fail2ban_: Test configuration
After putting the necessary files to *jail.d* and *filter.d*, test with:
~~~
fail2ban-regex /path/to/logfile /path/to/filter.d/filter
~~~

## _fail2ban_: Commit configuration
When confident that the test results work, apply configuration:
~~~
sudo fail2ban-client reload
~~~

## _fail2ban_: Verify configuration
Check running jails.
~~~
sudo fail2ban-client status
~~~

## _fail2ban_: Jail details
To check a particular jail (e.g. ssh)

~~~
sudo fail2ban-client status sshd
~~~
