# Kuro-wiki
[![Ruby on Rails CI](https://github.com/kuro-vale/kuro-wiki/actions/workflows/rubyonrails.yml/badge.svg)](https://github.com/kuro-vale/kuro-wiki/actions/workflows/rubyonrails.yml)

This is a web app made with Ruby on Rails, I made it for learning purposes only, some of the features are I18n translation, bootstrap frontend, pagination and basic authentication

## Quick setup

1. ```git clone https://github.com/kuro-vale/kuro-wiki.git```
2. Set environment variables
 - DEV_DATABASE_URL="postgres://username:password@host:port/dev-database"
 - TEST_DATABASE_URL="postgres://username:password@host:port/test-database"
 - PROD_DATABASE_URL="postgres://username:password@host:port/prod-database"

3. Run ```bundle install && yarn build && yarn build:css```
4. Migrate and seed database ```bin/rails db:migrate && bin/rails db:seed```
4. Run ```bin/rails server```

## Developer container

Alternatively you can test this project in a dev container for vscode

1. ```git clone https://github.com/kuro-vale/kuro-wiki.git```
2. Change environment variables in Dockerfile with your databases
3. Reopen directory in dev container using Dockerfile
4. Run ```bin/rails server```

## Add locales

To add new locale follow these steps:
1. Add your locale to I18n.available_locales in ```config/application.rb```
2. Generate migration to your locale example: ```bin/rails generate migration AddJapaneseToWiki title_jp body_jp```
3. Run ```bn/rails db:migrate```
4. Create your locales dictionaries in ```config/locales```, example devise.jp.yml and jp.yml
5. Optional, edit ```application.html.erb``` and add a link to change locale in line 19
