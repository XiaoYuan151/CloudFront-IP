#!/bin/bash
if !command -v ufw >/dev/null 2>&1; then
echo "UFW not found! please install it from your package manager!"
echo "For RHEL/CentOS/Fedora, use yum install ufw."
echo "For Ubuntu/Debian/Proxmox VE, use apt install ufw."
echo "Don't forgot to allow your ssh port before enable UFW!"
echo "When you finished it, just use command ufw enable to enable it!"
exit 1
fi
for line in `curl https://raw.githubusercontent.com/XiaoYuan151/CloudFront-IP/refs/heads/main/CloudFront-IPv4.txt`
do
  echo "Reading $line from CloudFront's offical ip list."
  ufw allow from $line to any port 80
  ufw allow from $line to any port 443
done
