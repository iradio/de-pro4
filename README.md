# de-pro4
Проект курса Data Enginner в Яндекс.Практикум, выполняемый в формате однодневного хакатона.

Во всех системах используются креды: de_user / de_pass , кроме metabase (там при первом старте)

Запуск инфрастуктуры
``` bash
docker-compose up -d
```

## Airflow
Разрабатываем DAG в [./airflow/dags](./airflow/dags)

## DBT
Разрабатываем DWH в виде SQL (select выражений) в [./dbt/project](./dbt/project)