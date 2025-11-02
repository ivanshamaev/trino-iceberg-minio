# trino-iceberg-minio
Тестовый проект по Trino + Iceberg + Rest Catalog + Minio s3 

- http://localhost:9001/ - minio (admin/password)
- http://localhost:8080/ - trino ui (admin, без пароля)


## Запуск 
```
docker compose down && docker compose up -d
```

## Запросы
```
select * from system.runtime.nodes;
```

# Trino

config.properties:
```
#single node install config
coordinator=true
node-scheduler.include-coordinator=true
http-server.http.port=8080
discovery.uri=http://localhost:8080
catalog.management=${ENV:CATALOG_MANAGEMENT}
```

# Portainer

```
docker volume create portainer_data

docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:lts
```