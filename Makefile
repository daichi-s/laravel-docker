# make
DC=docker-compose
STAGE=local
LARAVEL_VERSION=8.*

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
composer: # make composer C="コマンド" （例: make composer C="require {ライブラリ名}"）
	@$(DC) run --rm composer $(C)
composer_install:
	@$(DC) run --rm composer install
composer_update:
	@$(DC) run --rm composer update
composer_dump-autoload:
	@$(DC) run --rm composer dump-autoload

# yarn系
yarn: # make yarn C="コマンド" （例: make yarn C="add {ライブラリ名}"）
	@$(DC) exec node yarn $(C)
yarn_run_dev:
	@$(DC) exec node yarn run dev

# stripe-cli
stripe-cli:
	@$(DC) exec stripe-cli $(C)
stripe-listen:	# 自己証明だと怒られるので「--skip-verify」を指定
	@$(DC) exec stripe-cli stripe listen --forward-to https://localhost/api/v1/stripe/webhook --skip-verify 

# 環境構築コマンド
install:
	@$(DC) build --no-cache
	@cp app/laravel/.env.$(STAGE) app/laravel/.env
	@make up
	@make composer_install
	@make yarn
	@make yarn_run_dev

#laravel インストール
laravel:
	@$(DC) run --rm composer create-project --prefer-dist laravel/laravel="${LARAVEL_VERSION}"
