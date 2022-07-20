# README

TODO

### Add locales

To add new locale follow these steps:
1. Add your locale to I18n.available_locales in ```config/application.rb```
2. Generate migration to your locale example: ```bin/rails generate migration AddJapaneseToWiki title_jp body_jp```
3. Run ```bn/rails db:migrate```
4. Create your locales dictionaries in ```config/locales```, example devise.jp.yml and jp.yml
5. Optional, edit ```application.html.erb``` and add a link to change locale in line 19
