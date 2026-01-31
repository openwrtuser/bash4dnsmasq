This simple bash script downloads various filters for Dnsmasq from Internet, processes them, combines them into one file, and replaces existing /etc/dnsmasq.conf, with dnsmasq service restarting.

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

Prerequisite: Dnsmasq must be installed.
For Debian-like system, use the following command to install it:

sudo apt-get install dnsmasq
