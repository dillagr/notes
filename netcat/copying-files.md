## Using "netcat" to Copy Files Across the Network

#### IP Address of the receiver host
to obtain the IP address of the receiver host, run:

`~# ip a s`


#### On the receiver host
run this command on the receiver host (make sure this command is ran first)

```
~# nc -q 1 -l -p 9999 | pv | tar xv
```


#### On the transmitter host
run this command on the transmitter host

```
~# tar cv . | nc -q 1 ${RCVIPADDR} 9999
```

or 

```
~# tar cv ${FILENAMES} | nc -q 1 ${RCVIPADDR} 9999
```
