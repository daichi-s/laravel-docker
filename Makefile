# make
DC=docker-compose
STAGE=local

# Docker
build:
	@$(DC) build
up:
	@$(DC) up -d
down:
	@$(DC) down
restart:
	@$(DC) restart
reload:
	@$(DC) down
	@$(DC) up -d
ps:
	@$(DC) ps
logs:
	@$(DC) logs

# コンテナ入る系
php:
	@$(DC) exec php bash
node:
	@$(DC) exec node bash

# composer系
composer_install:
	@$(DC) run --rm composer install
composer_update:
	@$(DC) run --rm composer update
composer_require: # make composer_require L="ライブラリ名"
	@$(DC) run --rm composer require $(L)

# yarn系
yarn:
	@$(DC) exec node yarn
yarn_run_dev:
	@$(DC) exec node yarn run dev

# 環境構築コマンド
install:
	@cp .env-$(STAGE) .env
	@make composer_install
	@make yarn
	@make yarn_run_dev
	@make up

#laravel8 インストール
laravel:
	@$(DC) run --rm composer create-project --prefer-dist laravel/laravel="8.*"