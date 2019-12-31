# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# devicesAPI

### Tools
- rails -api '5.2.4' verzija RubyOnRails framework-a.
- ruby '2.6.4'
- postgreSQL 11.6 

## [API Docs](https://morporkk.github.io/slate/?shell#introduction)

https://morporkk.github.io/slate/?shell#introduction

Integracija sa swaggerom za rails aplikacije uglavnom ide preko RSpec test biblioteke,
minitest opcija je znatno slabije dokumentovana pa sam posle par neuspjelih pokusaja pjeske napravio Docs uz slate template :'D.

## Install
paketi:

```
$sudo apt install curl git nodejs gcc make libssl-dev libreadline-dev zlib1g-dev
````

rbenv

```shell
$git clone https://github.com/rbenv/rbenv.git ~/.rbenv`


$echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
$echo 'eval "$(rbenv init -)"' >> ~/.bashrc
$exit

$mkdir -p "$(rbenv root)"/plugins
$git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```
ruby/rails:
```
$rbenv install 2.6.4 --verbose
$gem install rails -v 5.2.4
```

Za windows isto ovo sve samo kroz [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10?redirectedfrom=MSDN) :D

Da pokrenete aplikaciju lokalno klonirajte repo i onda:
```
$bundle install 
```
u `config/database.yml` file-u podesite psql credentials
```
$rails db:migrate`
$rails s`
```

### Notes

- API je hostovan na https://bild-devicesapi-test.herokuapp.com/api.
Kako sam koristio free heroku tier, posle nekih pola sata neaktivnosti aplikacija ide na sleep mode, pa
prvi request moze da potraje dok se ponovo pokrene (:
- Trenutno radi samo sa JSON formatom.

### TODO

- Add XML support along with json
- add some static page at root or link for docs
- fix edgecase/bugs in update actions
- improve tests
- finish and merge dynamic prop value search branch
- rename params
- maybe add aliases for models for clearer code
- add index to frequent columns
- improve seed
- add custom error responses

