### *_VIRTUAL INTERFACE_*
To add a virtual interface, simply execute the following command:
```
sudo ip address add 192.168.1.x/24 dev eth0
```
.. or add it in /etc/rc.local to make it sticky on reboots.  

To delete:
```
sudo ip address del 192.168.1.x/24 dev eth0
```
