#!/bin/bash
imel="hendykusnandy@gmail.com"
key="8ffca2a35ab4c6577c875232dda429b605cad"
sub="shop"
zone="1479d9655befa35f9ad174401cf1ae2c"
domen="dotaja.my.id"
ipena=$(curl -s ifconfig.me)

curl -X DELETE "https://api.cloudflare.com/client/v4/zones/$zone/dns_records?type=A&name=$sub.$domen" \
     -H "X-Auth-Email: $imel" \
     -H "X-Auth-Key: $key" \
     -H "Content-Type: application/json"

curl -X POST "https://api.cloudflare.com/client/v4/zones/$zone/dns_records" \
     -H "X-Auth-Email: $imel" \
     -H "X-Auth-Key: $key" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'$sub'","content":"'$ipena'","ttl":1,"proxied":false}'

sudo certbot certonly --non-interactive --agree-tos -d $sub.$domen
