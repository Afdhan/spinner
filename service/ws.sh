#!/bin/bash
# SSH Over Websocket Dropbear

# Get Template
wget -q -O /usr/local/bin/ws-drop "https://raw.githubusercontent.com/Afdhan/sce/main/hihi.py"
chmod +x /usr/local/bin/edu-drop

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
figlet -f slant And Sevices NezaVPN | lolcat
sleep 5
echo -e "Services Port WebSocket Dropbear Now       : 2086" | lolcat
rm -f ws.sh
