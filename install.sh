
#!/bin/bash

cp tv-status.sh /usr/local/bin/
cp turn-on-lights.sh /usr/local/bin/
cp turn-off-lights.sh /usr/local/bin/
chmod u+x /usr/local/bin/tv-status.sh
chmod u+x /usr/local/bin/turn-on-lights.sh
chmod u+x /usr/local/bin/turn-off-lights.sh

cp tvStatus.service /etc/systemd/system
