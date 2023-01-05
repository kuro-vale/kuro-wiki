# Kuro-wiki
[![PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/kuro-vale/kuro-wiki/main/pwd-stack.yml) [![Ruby on Rails CI](https://github.com/kuro-vale/kuro-wiki/actions/workflows/rubyonrails.yml/badge.svg)](https://github.com/kuro-vale/kuro-wiki/actions/workflows/rubyonrails.yml)

This is a web app made with Ruby on Rails, I made it for learning purposes only, some of the features are I18n translation, bootstrap frontend, pagination and basic authentication.

The thematic of this app is Wikipedia.

## Screenshots

#### Home
![Screenshot_20230105_124404](https://user-images.githubusercontent.com/87244716/210845938-94b49dc4-c189-43ce-a33e-85c61ba90169.png)
#### Wikis
![Screenshot_20230105_124512](https://user-images.githubusercontent.com/87244716/210846047-187de21f-330f-4edb-8d0e-25a1a24b6583.png)
#### Creating a Wiki
![Screenshot_20230105_124643](https://user-images.githubusercontent.com/87244716/210846333-5414bc1e-5ed5-415f-9658-0c5b00458bcf.png)
#### Adding Translation
![Screenshot_20230105_124740](https://user-images.githubusercontent.com/87244716/210846497-fab88d08-e849-4c3e-9581-c5974f9b58db.png)

## Deploy

Follow any of these methods and open http://localhost:3000/ to see the WebApp.

### Docker

Run the command below to quickly deploy this project on your machine, see the [docker image](https://hub.docker.com/r/kurovale/kuro-wiki) for more info.

```bash
docker run -d -p 3000:3000 kurovale/kuro-wiki:sqlite
```

## Quick setup

1. ```git clone https://github.com/kuro-vale/kuro-wiki.git```
2. Set environment variables
 - DEV_DATABASE_URL="postgres://username:password@host:port/dev-database"
 - TEST_DATABASE_URL="postgres://username:password@host:port/test-database"
 - PROD_DATABASE_URL="postgres://username:password@host:port/prod-database"

3. Run ```bundle install && yarn build && yarn build:css```
4. Migrate and seed database ```bin/rails db:migrate && bin/rails db:seed```
4. Run ```bin/rails server```

## Add locales

To add new locale follow these steps:
1. Add your locale to I18n.available_locales in ```config/application.rb```
2. Generate migration to your locale example: ```bin/rails generate migration AddJapaneseToWiki title_jp body_jp```
3. Run ```bn/rails db:migrate```
4. Create your locales dictionaries in ```config/locales```, example devise.jp.yml and jp.yml
5. Optional, edit ```application.html.erb``` and add a link to change locale in line 19
