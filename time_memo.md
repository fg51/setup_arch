$ timedatectl status

/etc/systemd/timesyncd.conf
[Time]
NTP=0.arch.pool.ntp.org 1.arch.pool.ntp.org 2.arch.pool.ntp.org 3.arch.pool.ntp.org
FallbackNTP=0.pool.ntp.org 1.pool.ntp.org 0.jp.pool.ntp.org

$ timedatectl set-ntp true
