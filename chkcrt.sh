#! /bin/zsh
domain=${1%/}
echo $domain
if [[ $2 == "ca" ]]; then
  echo | openssl s_client -showcerts -servername $domain -connect $domain:443 2>/dev/null | openssl x509 -inform pem -noout -text | grep "CA Issuers";
else
  echo | openssl s_client -showcerts -servername $domain -connect $domain:443 2>/dev/null | openssl x509 -inform pem -noout -text;
fi
