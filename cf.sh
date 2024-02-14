#!/bin/bash
imel="hendykusnandy@gmail.com"
key="8ffca2a35ab4c6577c875232dda429b605cad"
domen="toko.dotaja.my.id"
ipena=$(curl -s ifconfig.me)

curl -X PUT "https://api.cloudflare.com/client/v4/zones/1479d9655befa35f9ad174401cf1ae2c/dns_records" \
     -H "X-Auth-Email: $imel" \
     -H "X-Auth-Key: $key" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'$domen'","content":"'$ipena'","ttl":1,"proxied":false}'

certbot --apache --domain $domen
certbot renew --quiet
