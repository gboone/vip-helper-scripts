#! /bin/zsh
site_id=$1
echo $site_id
VIP_PROXY=socks://localhost:8080
/usr/local/bin/vip @${site_id}.production --yes -- wp core version
