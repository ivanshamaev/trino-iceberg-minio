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

# Trino UI

![Trino UI интерфейс](docs/media/trino_ui.gif)

# Portainer

```
docker volume create portainer_data

docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:lts
```

# VPS

Для теста мне хватило
- CPU: 2 Ядра
- Память: 6 ГБ
- NVMe: 15 ГБ