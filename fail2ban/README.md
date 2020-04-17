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
