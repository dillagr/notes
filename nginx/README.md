## _nginx: Test configuration
After making the necessary configuration changes, first test the change.
~~~
sudo nginx -t
~~~

## _nginx: Commit configuration
When confident that the test results work, apply configuration:
~~~
sudo nginx -s reload
~~~

## _nginx: Restart Service
If you want a clean, restart execute:
~~~
sudo systemctl restart nginx
~~~

