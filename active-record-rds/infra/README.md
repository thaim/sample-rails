RDS接続評価用Terraform
==============================


## コマンドメモ
### 利用できるRDSエンジンを蓮炬する
$ aws --profile spacely-dev rds describe-db-engine-versions \
      | jq '.DBEngineVersions[] | { engine: .Engine, version: .EngineVersion }'
