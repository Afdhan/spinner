#!/bin/bash
# SSH Over Websocket Dropbear

pw="dhansss"
read -p "Password Script : " pass
if [ $pass == $pw ]; then
  echo -e "Correcting Password..."
  echo -e "Done! Password Input Successfully"
else
  echo -e "Correcting Password..."
  echo -e "Failed! Wrong Password!"
  exit 0
fi

# Get Template
wget -q -O /usr/local/bin/ws-drop "https://dhans-project.xyz/service/ws.py"
chmod +x /usr/local/bin/ws-drop

# Docs Here
cat > /etc/systemd/system/ws-dropbear.service << END
[Unit]
Description=WebSocket Dropbear By Dhansss
Documentation=https://dhans-project.xyz
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-drop 2086
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

# Start Here
systemctl daemon-reload
systemctl enable ws-drop
systemctl restart ws-drop

echo -e "Done Install WebSocket Dropbear"
sleep 5
clear
figlet -f slant WebSocket Dropbear | lolcat
figlet -f slant Powered By M AFDHAN | lolcat
figlet -f slant And Partner NezaVPN | lolcat
sleep 5
echo -e "Services Port WebSocket Dropbear Now       : 2086" | lolcat
rm -f ws.sh
