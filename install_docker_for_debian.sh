#!/bin/sh

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# TIP: Change the distribution to your own Debian version
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  bookworm stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# TIP: Change the proxy to your own proxy
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": [
    "https://hub.geekery.cn",
    "https://hub.littlediary.cn",
    "https://docker.rainbond.cc"
  ],
  "proxies": {
    "http-proxy": "http://proxy.groveer.com:7890",
    "https-proxy": "http://proxy.groveer.com:7890",
    "no-proxy": "localhost,127.0.0.1,::1"
  }
}
EOF

sudo systemctl enable --now docker
