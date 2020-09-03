## _Use tcp_bbr as default congestion control algorithm_

* Install Hardware Enablement Stack (HWE) to update kernel automaticly:

   ```
   apt install --install-recommends linux-generic-hwe-16.04
   ```

* Enable the tcp_bbr module at boot:

   ```
   sudo wget -O /etc/modules-load.d/modules.conf \
   https://github.com/dillagr/notes/raw/master/tcp-bbr/bbr.conf
   ```

* Configure the system to default to tcp_bbr:

   ```
   sudo wget -O /etc/sysctl.d/99-tcp-bbr.conf \
   https://github.com/dillagr/notes/raw/master/tcp-bbr/99-tcp-bbr.conf
   ```


