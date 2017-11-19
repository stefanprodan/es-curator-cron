#!/bin/sh

PERIOD=1m
KEEP_DAYS=1
INDEX_PREFIX=logstash
mkdir -p /etc/periodic/${PERIOD}
cat > /etc/periodic/${PERIOD}/0-curator <<EOF
#!/bin/sh
/usr/bin/curator_cli $@ \
    delete_indices \
    --ignore_empty_list \
    --filter_list '[{"filtertype":"age","source":"name","direction":"older","unit":"days","unit_count":${KEEP_DAYS},"timestring": "%Y.%m.%d"},{"filtertype":"pattern","kind":"prefix","value":"${INDEX_PREFIX}"}]'
EOF
chmod +x /etc/periodic/${PERIOD}/0-curator
echo $(cat /etc/periodic/${PERIOD}/0-curator)
exec crond -f
