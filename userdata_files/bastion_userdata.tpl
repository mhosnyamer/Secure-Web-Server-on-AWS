#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
echo "Hello From ${instance_name}" > /var/www/html/index.html

# Configure Nginx to be a Reverse Proxy
cat << EOF > /etc/nginx/sites-available/default
server {
    listen 80;
    server_name _;
    location / {
        proxy_pass http://${internal_dns};
        proxy_set_header Host \$http_host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF
# Test and restart Nginx
sudo nginx -t
sudo systemctl restart nginx