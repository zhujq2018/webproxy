#!/bin/bash
export USER=root
mkdir -p /var/run/sshd
mv /authorized_keys /root/.ssh/authorized_keys
mv /id_rsa /root/.ssh/id_rsa
mv /id_rsa.pub /root/.ssh/id_rsa.pub
chmod 600 /root/.ssh/authorized_keys
chmod 600 /root/.ssh/id_rsa
chmod 644 /root/.ssh/id_rsa.pub
nohup /usr/sbin/sshd -D &
echo 'PS1='"'"'${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;35;35m\]\w\[\033[00m\]\$\033[1;32;32m\] '"'" >> /root/.bashrc
mkdir -p /root/tail
cd /root/tail
wget https://pkgs.tailscale.com/stable/tailscale_1.34.1_amd64.tgz
tar xzf tailscale_1.34.1_amd64.tgz --strip-components=1
mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale
nohup ./tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &
./tailscale up --authkey=tskey-auth-kFz69C5CNTRL-rXBP3XXvmoYtTV6SW3SftYDaQczMSmk8a --hostname=northf-vps

cd /
chmod +x server
/server 
