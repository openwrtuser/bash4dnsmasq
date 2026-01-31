A simple bash script to block AGGRESSIVELY unwanted content via dnsmasq (ads, trackers, adult content, malware, etc).

This script downloads various filters for Dnsmasq from Internet, processes them, combines them into one file, and replaces existing /etc/dnsmasq.conf, with dnsmasq service restarting.

This file also blocks connections to all DoH (DNS over HTTPS) servers, to avoid bypassing itself via DoH.

Filters used:

Hagezi DoH servers
https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/dnsmasq/doh.txt

Steve Black's filters (Unified hosts + gambling + adult + social)
https://scripttiger.github.io/alts/dnsmasq/blacklist-gps.txt

OISD NSFW (adult content)
wget https://raw.githubusercontent.com/sjhgvr/oisd/refs/heads/main/dnsmasq2_nsfw.txt

OISD BIG (ads, trackers, malware, etc)
wget https://raw.githubusercontent.com/sjhgvr/oisd/refs/heads/main/dnsmasq2_big.txt

Hagezi NSFW (adult content)
https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/dnsmasq/nsfw.txt

Hagezi Social (social networks)
https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/dnsmasq/social.txt

Hagezi Gambling (gambling)
https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/dnsmasq/gambling.txt

Hagezi Ultimate (ads, trackers, malware, etc)
https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/dnsmasq/ultimate.txt

Hagezi TIF (various dangerous content)
https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/dnsmasq/tif.txt

1hosts Xtra (ads, trackers, malware, etc)
https://github.com/badmojr/1Hosts/releases/download/latest/1hosts-Xtra_dnsmasq.conf

==================================================

Prerequisites:

Dnsmasq, wget, sed, mawk must be installed.

For Debian-like system, use the following command to install them:

sudo apt-get install dnsmasq wget sed mawk

--------------------------------------------------------------------------------------

The scripts can be scheduled to run daily with cron, at a prescribed time (e.g. 6:30am).

In Debian Linuxs it can be done this way:

Copy the script to /etc/cron.daily

Under root, run

crontab -e

or

sudo crontab -e

Add last line:

30 06 * * * /etc/cron.daily/update.sh

Save, and restart cron:

sudo systemctl restart cron

or, simply reboot PC.

--------------------------------------------------------------------------------------

Use the scripts at your own risk. Some legitimate websites could stop working. (Again, it is a very AGGRESSIVE set of filters.)

In this case, you may try using less restrictive original filters (e.g. 1Hosts Lite, HaGeZi Multi PRO, Small oisd, etc.) in the script.

Modify the script to suit your needs.
