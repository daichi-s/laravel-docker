# 手順書
## 環境構築
1. 以下コマンドを実行
`$ make install` 

## SSL化
1. 下記コマンドを実行
`$ brew install mkcert`

2. ローカルに認証局を作成する
`$ mkcert -install`

3. localhost.pem localhost-key.pemを作成
touch localhost.pem
touch localhost-key.pem

4. localhostでSSL証明書を発行
`$ mkcert localhost`

5. localhost.pem localhost-key.pemを以下のディレクトリへ
`./docker/nginx/conf.d`

6. dockerコンテナ再起動
`$ make reload`