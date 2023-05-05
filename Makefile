# make
DC=docker-compose
LARAVEL_VERSION=10.*

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

# stripe-cli
stripe-listen:	# 自己証明だと怒られるので「--skip-verify」を指定
	@$(DC) exec stripe-cli stripe listen --forward-to https://localhost/api/v1/stripe/webhook --skip-verify 

# 環境構築コマンド
install:
	@$(DC) build --no-cache
	@cp app/laravel/.env.local app/laravel/.env
	@make up
	@$(DC) exec app composer_install
	@$(DC) exec app yarn
	@$(DC) exec app yarn dev

# laravelインストール&セットアップ
laravel:
	@$(DC) exec app composer create-project --prefer-dist laravel/laravel="${LARAVEL_VERSION}"
	@mv app/laravel/laravel .
	@rm -r app/laravel
	@mv laravel app
	@make up
	@$(DC) exec app yarn
	@$(DC) exec app yarn dev
