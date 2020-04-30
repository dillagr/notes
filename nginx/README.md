## _nginx Build Pre-requisites_
If you want to compile your own nginx from source, the following prerequisite packages may be required. This is geared more towards debian based Linux, and Ubuntu in particular.
~~~
sudo apt -y install libpcre3 \
    libpcre3-dev \
    openssl \
    libssl-dev \
    zlib1g \
    zlib1g-dev \
    libxslt-dev \
    libgd-dev \
    libgeoip-dev
~~~

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

## _Suggested "nginx" Trainings_
Should you want to self-train about nginx, with particular focus on configuration and optimization, the following self-paced training modules have been a big help to me:

* [Nginx Fundamentals: High Performance Servers from Scratch](https://bit.ly/2RTdSOe)
* [Nginx 2019 - Beginner to Advanced](https://bit.ly/2VMuJ7P)

