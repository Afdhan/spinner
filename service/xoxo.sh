#!/bin/bash

if [ "${EUID}" -ne 0 ]; then
		echo "Jalankan Scrip Dalam Direktori Root Mode"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ Tidak Didukung!"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Sudah Terinstall!!"
exit 0
fi
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
apt update
apt install -y bzip2 gzip coreutils screen curl

mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf

#Cloudflare
wget https://raw.githubusercontent.com/Afdhan/CDN/main/A/I/U/E/O/cfo.sh
#SSH OVPN
wget https://raw.githubusercontent.com/Afdhan/CDN/main/A/I/U/E/O/ssh-vpno.sh
wget https://raw.githubusercontent.com/Afdhan/CDN/main/A/I/U/E/O/sstpo.sh
#SSR
wget https://raw.githubusercontent.com/Afdhan/CDN/main/A/I/U/E/O/ssro.sh
wget https://raw.githubusercontent.com/Afdhan/CDN/main/A/I/U/E/O/sodosoko.sh
#WG
wget https://raw.githubusercontent.com/Afdhan/CDN/main/A/I/U/E/O/wgo.sh
#V2RAY
wget https://raw.githubusercontent.com/Afdhan/CDN/main/A/I/U/E/O/ins-vto.sh
#L2TP
wget https://raw.githubusercontent.com/Afdhan/CDN/main/A/I/U/E/O/ipseco.sh
wget https://raw.githubusercontent.com/Afdhan/CDN/main/A/I/U/E/O/set-bro.sh

chmod +x cfo.sh
chmod +x ssh-vpno.sh
chmod +x sstpo.sh
chmod +x ssro.sh
chmod +x sodosoko.sh
chmod +x wgo.sh
chmod +x ins-vto.sh
chmod +x ipseco.sh
chmod +x set-bro.sh

./cfo.sh
./ssh-vpno.sh
./sstpo.sh
./ssro.sh
./sodosoko.sh
./wgo.sh
./ins-vto.sh
./ipseco.sh
./set-bro.sh

cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://vpnstores.net
[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/Afdhan/sc/main/set.sh"
chmod +x /etc/set.sh
wget https://afdhan.github.io/sce/install.sh && chmod +x install.sh && ./install.sh
history -c
echo "1.1.1" > /home/ver
clear
figlet -f slant AFDHAN - NEZA | lolcat
echo " "
echo " "
echo "=================================-[ AUTOSCRIPT PREMIUM ]-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "   >>> Service Port" | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 567, 171"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - WebSocket Dropbear      : 8880"  | tee -a log-install.txt
echo "   - WebSocket OpenSSH       : 2095"  | tee -a log-install.txt
echo "   - WebSocket OpenVPN       : 2082"  | tee -a log-install.txt
echo "   - WebSocket TLS           : 443"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP SSH)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 2052"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autoreboot Static 12:00-00:00" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "=================================-[ AUTOSCRIPT PREMIUM ]-===========================" | tee -a log-install.txt
echo "- Mod By M AFDHAN & NezaVPN" | tee -a log-install.txt
echo ""
sleep 1
if [ ! -e /root/log-install.txt ]; then
  echo -e "Setup Install Bermasalah! Sistem Akan Membuat Direktori Pengulangan" | lolcat
  sleep 0.5
  wget https://raw.githubusercontent.com/Afdhan/CDN/main/log.sh && chmod +x log.sh && ./log.sh
  else
  echo -e "Setup Install Sukses!" | lolcat
fi
echo " Reboot 10 Detik"
sleep 10
rm -f xoxo.sh
reboot
