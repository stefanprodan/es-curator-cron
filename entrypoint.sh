#!/bin/sh
# save provided arguments
cat > /etc/periodic/daily/0-curator <<EOF
#!/bin/sh
/usr/bin/curator_cli $@
EOF
chmod +x /etc/periodic/daily/0-curator
echo "JOB: curator_cli $@"
exec crond -f
