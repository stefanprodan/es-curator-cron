# es-curator-cron

Elasticsearch v6 Curator Logstash indices retention cron job

### Run

Docker Swarm stack:

```yaml
version: "3.3"

services:
  curator:
    image: stefanprodan/es-curator-cron
    environment:
      - "PERIOD=15min"
      - "KEEP_DAYS=30"
      - "INDEX_PREFIX=logstash"
    command: "--host elasticsearch --port 9200"
```

You can set the cron `PERIOD` to 15min, hourly, daily, weekly and monthly.

The default index pattern is `[prefix-]%Y.%m.%d`.
