#!/usr/bin/env bash
# Nginx troubleshooting script

echo "=== Nginx Troubleshooting ==="
echo

echo "1. Checking if Nginx is running:"
ps aux | grep nginx
echo

echo "2. Checking Nginx service status:"
service nginx status
echo

echo "3. Checking if port 80 is listening:"
netstat -tlnp | grep :80
echo

echo "4. Testing local connection:"
curl -v localhost 2>&1 | head -20
echo

echo "5. Checking Nginx configuration:"
nginx -t
echo

echo "6. Checking Nginx error logs:"
echo "--- Last 10 lines of error log ---"
tail -10 /var/log/nginx/error.log
echo

echo "7. Checking if HTML file exists:"
ls -la /var/www/html/index.html
echo "Content:"
cat /var/www/html/index.html
echo

echo "8. Checking firewall status:"
ufw status
echo

echo "9. Manual restart attempt:"
service nginx stop
service nginx start
echo "Restart completed"