## _Use tcp_bbr as default congestion control algorithm_

Install Hardware Enablement Stack (HWE) to update kernel automaticly:

   ```
   apt install --install-recommends linux-generic-hwe-16.04
   ```

Enable the tcp_bbr module at boot:

   ```
   sudo wget -O /etc/modules-load.d/tcp-bbr.conf \
   https://github.com/dillagr/notes/raw/master/tcp-bbr/bbr.conf
   ```

Configure the system to default to tcp_bbr:

   ```
   sudo wget -O /etc/sysctl.d/99-tcp-bbr.conf \
   https://github.com/dillagr/notes/raw/master/tcp-bbr/99-tcp-bbr.conf
   ```

This change requires a reboot (unless the kernel required has been installed already). After reboot, execute the command(s) below to see that **bbr** is the congestion control algorithm used. The algorithm **bbr** needs to be working in tandem with **fq**

   ```
   sysctl -a | grep qdisc
   sysctl -a | grep congestion_control
   ```

You should be able to see the configuration changes from the files downloaded.


## _Additional Tweak_

Increase TCP backlog limits (from default value of 128 to 4096):

   ```
   sudo wget -O /etc/sysctl.d/98-somaxconn.conf \
   https://github.com/dillagr/notes/raw/master/tcp-bbr/98-somaxconn.conf
   ```

## _Relevant links_

[net.core.default_qdisc](https://sysctl-explorer.net/net/core/default_qdisc/)

   ```
   fq ==> should be the desired value if bbr is used.
   ```
