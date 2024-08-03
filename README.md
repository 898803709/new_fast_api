# fast_api

## url
- http://0.0.0.0:8000
- http://0.0.0.0:8000/docs

## DBマイグレーション
```
docker compose exec fast_api poetry run python -m api.migrate_db
```

## MySql接続
```
docker compose exec db mysql demo
```

```
SHOW TABLES
```