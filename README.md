This simple bash script downloads various filters for Dnsmasq from Internet, processes them, combines them into one file, and replaces existing /etc/dnsmasq.conf, with dnsmasq service restarting.

This file also blocks connections to all DoH (DNS over HTTPS) servers, to avoid bypassing itself via DoH.

Prerequisite: Dnsmasq must be installed.
For Debian-like system, use the following command to install it:

sudo apt-get install dnsmasq
