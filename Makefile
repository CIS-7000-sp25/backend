.PHONY: all login install migrate run

all: login migrate run

login:
	mysql -u root -p

migrate:
	python asset_library/manage.py makemigrations
	python asset_library/manage.py migrate

run:
	python asset_library/manage.py runserver

npm-dev:
	npm --prefix=./asset_library run dev

# Have mysql user, password and host set as defaults
dump:
	mysqldump --order-by-primary --skip-extended-insert --no-tablespaces --single-transaction railway > assets_backup.sql

# env-up:
# 	pyenv activate usd-asset-library; \

# env-down:
# 	pyenv deactivate usd-asset-library; \
