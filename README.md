# README
## docker compose build
```bash
dcb
```
## docker compose up
```bash
dcu
```
## docker compose down
```bash
dcd
```

## 初回実行コマンド
```bash
dcu
dce api rails db:create
dce api rails db:migrate
dce api rails db:seed
```

## swagger-ui
swagger-iu/myapp_api.yamlを開いて以下を実行
```bash
Press Shift + option + P
```

## バッチ実行コマンド
例）Testテーブルにインポートする場合
```bash
dce api rails runner Batch::TestModule::TestImportBatch.import
```
