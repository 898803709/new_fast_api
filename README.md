# new_fast_api
## build image
```
docker build -t new_fast_api .
```
### url
- [home page](http://0.0.0.0:8000)
- [swagger ui](http://0.0.0.0:8000/docs)

### DBマイグレーション
```
docker compose exec fast_api poetry run python -m api.migrate_db
```

### MySql接続
```
docker compose exec db mysql demo
```

```
SHOW TABLES
```