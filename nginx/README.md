## _nginx: Test configuration_
After making the necessary configuration changes, first test the change.
~~~
sudo nginx -t
~~~

## _nginx: Commit configuration_
When confident that the test results work, apply configuration:
~~~
sudo nginx -s reload
~~~

## _nginx: Restart Service_
If you want a clean, restart execute:
~~~
sudo systemctl restart nginx
~~~

## _Suggested NGINX Trainings_
Should you want to self-train about nginx, with particular focus on configuration and optimization, the following self-paced training modules have been a big help to me:

* [Nginx Fundamentals: High Performance Servers from Scratch](https://bit.ly/2RTdSOe)
* [Nginx 2019 - Beginner to Advanced](https://bit.ly/2VMuJ7P)

