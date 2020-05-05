## _Activate the Uncomplicated FireWall (UFW)_
The uncomplicated firewall is not enabled by default. Enable it.

~~~
sudo ufw enable
~~~

## _Set the Default UFW Behavior (Make UFW Stateful)_
First, set the default UFW behavior. Make it stateful, allow everything out but filter/deny incoming packets.

~~~
sudo ufw default allow outgoing
sudo ufw default deny incoming
~~~
With this setting in place, you worry about incoming rules. The simpler and easier to understand the rules, the better.

## _Allow All Incoming HTTP and HTTPS_
If you want to allow both HTTP and HTTPS traffic, you can create a single rule that allows both ports. To allow all incoming HTTP and HTTPS (port 443) connections run this command:

~~~
sudo ufw allow proto tcp from any to any port 80,443
~~~
This is an all-in-one command to allow both ports 80 and 443 access to the host. Usually they work in tandem. To individually allow each port, use command:

~~~
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
~~~

## _Allow Incoming SSH from Specific IP Address or Subnet_
~~~
sudo ufw allow from 10.1.1.0/24 to any port 22
sudo ufw allow from [SUBNET/CIDR] to any port 22
~~~

## _Check UFW Rules_
To check and verify existing firewall rules

~~~
sudo ufw status verbose
~~~

## _To Delete UFW Rules_
Simple prepend the keyword ***delete*** after the _ufw_ in the command (e.g.):

~~~
sudo ufw allow from 10.1.1.0/24 to any port 22/tcp           ## this command adds the rule
sudo ufw delete allow from 10.1.1.0/24 to any port 22/tcp    ## this command deletes the rule
~~~
