sudo python3 -m pip install ansible

cat > ~/.ssh/config << EOF
Host node2
    HostName 192.168.0.17
    User root
    Port 22
Host node3
    HostName 192.168.0.16
    User root
    Port 22
Host node4
    HostName 192.168.0.15
    User root
    Port 22
EOF