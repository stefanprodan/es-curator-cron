# es-curator-cron

Docker Alpine image with Elasticsearch Curator daily cron job

### Run

Stack:

```yaml
version: "3.3"

services:
  curator:
    image: stefanprodan/es-curator-cron
    command: "--host esdata --port 9200 delete_indices --ignore_empty_list --filter_list \'[{\"filtertype\":\"age\",\"source\":\"name\",\"direction\":\"older\",\"unit\":\"days\",\"unit_count\":1,\"timestring\": \"%Y.%m.%d\"},{\"filtertype\":\"pattern\",\"kind\":\"prefix\",\"value\":\"logstash\"}]\'"
```
