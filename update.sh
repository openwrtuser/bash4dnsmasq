#!/bin/bash
cd /etc/dnsmasq.d

# Hagezi DoH
wget https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/dnsmasq/doh.txt
# Remove Adguard DoH servers
# sed -i '/adguard-dns.com/d' doh.txt

# SB (Unified hosts + gambling + adult + social)
wget https://scripttiger.github.io/alts/dnsmasq/blacklist-gps.txt
# Replacing address with local (because of dnsmasq version)
sed -i -e 's/address/local/' blacklist-gps.txt

# OISD NSFW
wget https://raw.githubusercontent.com/sjhgvr/oisd/refs/heads/main/dnsmasq2_nsfw.txt
echo "" >> dnsmasq2_nsfw.txt

# OISD BIG
wget https://raw.githubusercontent.com/sjhgvr/oisd/refs/heads/main/dnsmasq2_big.txt
echo "" >> dnsmasq2_big.txt

# Hagezi NSFW
wget https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/dnsmasq/nsfw.txt

# Hagezi Social
wget https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/dnsmasq/social.txt

# Hagezi Gambling
wget https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/dnsmasq/gambling.txt

# Hagezi Ultimate
wget https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/dnsmasq/ultimate.txt

# Hagezi TIF
wget https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/dnsmasq/tif.txt

# 1hosts Xtra
wget https://github.com/badmojr/1Hosts/releases/download/latest/1hosts-Xtra_dnsmasq.conf
# Replacing server with local (because of dnsmasq version)
sed -i -e 's/server/local/' 1hosts-Xtra_dnsmasq.conf

# Merging all these files into one file
cat doh.txt blacklist-gps.txt dnsmasq2_nsfw.txt dnsmasq2_big.txt nsfw.txt social.txt gambling.txt ultimate.txt tif.txt 1hosts-Xtra_dnsmasq.conf > mydnsmasq.txt
# Removing unneeded hosts files
rm -f doh.txt blacklist-gps.txt dnsmasq2_nsfw.txt dnsmasq2_big.txt nsfw.txt social.txt gambling.txt ultimate.txt tif.txt 1hosts-Xtra_dnsmasq.conf
# Remove all empty lines
sed -i '/^$/d' mydnsmasq.txt
# Removing all commented lines
sed -i '/^#/d' mydnsmasq.txt
# Removing duplicate lines
awk '!seen[$0]++' mydnsmasq.txt > mydnsmasq
# Removing unneeded mydnsmasq.txt file
rm -f mydnsmasq.txt
# Add an empty line at the end
sed -i -e '$a\' mydnsmasq
# Replacing existing hosts file
mv mydnsmasq /etc/dnsmasq.conf

systemctl restart dnsmasq.service
