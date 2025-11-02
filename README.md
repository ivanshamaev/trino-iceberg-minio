# trino-iceberg-minio
Тестовый проект по Trino + Iceberg + Rest Catalog + Minio s3 

- http://localhost:9001/ - minio (admin/password)
- http://localhost:8080/ - trino ui (admin, без пароля)

## TODOs
1. Настроить связь между trino и minio (не создаются таблицы)
2. 

## Запуск 
```
docker compose down && docker compose up -d
```

## Запросы
```
select * from system.runtime.nodes;
```