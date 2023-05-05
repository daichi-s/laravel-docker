# 手順書
## Laravelインストール&セットアップ
1. 以下コマンドを実行
```
$ make laravel
``` 

## minioの初期設定
1. http://localhost:9000にアクセス
2. 以下の情報でログイン
```
Access Key: minio
Secret Key: Password@1000
```

3. バケットを作成
```
バケット名: {任意のバケット名}
```

4. バケットポリシーでアクセス権限を許可する
バケット名の右の設定からEdit Policy -> Read and Write の権限を追加

## SSL化
1. 下記コマンドを実行
```
$ brew install mkcert
``` 

2. ローカルに認証局を作成する
```
$ mkcert -install
``` 

3. localhost.pem localhost-key.pemを作成
```
$ touch localhost.pem
$ touch localhost-key.pem
```

4. localhostでSSL証明書を発行
```
$ mkcert localhost
``` 

5. localhost.pem localhost-key.pemを以下のディレクトリへ
```
./docker/nginx/conf.d
``` 

6. dockerコンテナ再起動
```
$ make reload
```

7. 確認

```
https://localhost

上記に接続して、認証が保護されていればOK
```
