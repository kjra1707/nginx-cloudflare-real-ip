#!/bin/bash
echo "#Cloudflare" > /usr/local/nginx/conf/cloudflare.conf;
echo "" >> /usr/local/nginx/conf/cloudflare.conf;

echo "# - IPv4" >> /usr/local/nginx/conf/cloudflare.conf;
for i in `curl https://www.cloudflare.com/ips-v4`; do
        echo "set_real_ip_from $i;" >> /usr/local/nginx/conf/cloudflare.conf;
done

echo "" >> /usr/local/nginx/conf/cloudflare.conf;
echo "# - IPv6" >> /usr/local/nginx/conf/cloudflare.conf;
for i in `curl https://www.cloudflare.com/ips-v6`; do
        echo "set_real_ip_from $i;" >> /usr/local/nginx/conf/cloudflare.conf;
done

echo "" >> /usr/local/nginx/conf/cloudflare.conf;
echo "real_ip_header CF-Connecting-IP;" >> /usr/local/nginx/conf/cloudflare.conf;

#test configuration and reload nginx
nginx -t && systemctl reload nginx
