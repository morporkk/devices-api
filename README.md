
# devicesAPI

### Tools
- rails -api '5.2.4' verzija RubyOnRails framework-a.
- ruby '2.6.4'
- postgreSQL 11.6 

## [API Docs](https://morporkk.github.io/slate/?shell#introduction)

https://morporkk.github.io/slate/?shell#introduction

Integracija sa swaggerom za rails aplikacije uglavnom ide preko RSpec test biblioteke,
minitest opcija je znatno slabije dokumentovana pa sam posle par neuspjelih pokusaja odlucio da pjeske napravim Docs uz slate template :').

## Local Install

Ja trenutno koristim Xubuntu ali aplikacija moze da se pokrene lokalno i na windowsu kroz [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10?redirectedfrom=MSDN)(ubuntu)

#### paketi:

```
sudo apt install curl git nodejs gcc make libssl-dev libreadline-dev zlib1g-dev
````

#### rbenv:

```shell
git clone https://github.com/rbenv/rbenv.git ~/.rbenv


echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exit

mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```
#### ruby/rails:
```
rbenv install 2.6.4 --verbose
rbenv global 2.6.4
gem install rails -v 5.2.4
```


Da pokrenete aplikaciju lokalno klonirajte repo, cd u njega i pokrenite bundler:
```
bundle install 
```
u `config/database.yml` file-u unesite user/password vaseg pg user acc. i pokrenite psql server. Nakon toga:
```
rails db:create
rails db:migrate
```

I na kraju pokrenite server `rails s`

### SQLite opcija

Ako vam se ne namjesta postgreSQL server, a i moze doci do komplikacija preko WSL-a, za lokalno testiranje mozetete prebaciti na SQLite3

```
sudo apt install libsqlite3-dev
```
Izbrisite liniju 9 u `Gemfile`-u, i zamjenite obrisanu liniju sa
```
group :development, :test do
 gem 'sqlite3'
end
```

I pokrenite bundler:
```
bundle install
```

Izbrisite sadrzaj `config/database.yml` file-a i kopirajte ovo

```
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3

test:
  <<: *default
  database: db/test.sqlite3

production:
  <<: *default
  database: db/production.sqlite3

```

Pokrenite migracije sa `rails db:migrate` i kreiracete SQLite bazu u `db/development.sqlite3`

Na kraju pokrenite i server `rails s` 

### Notes

- API je hostovan na https://bild-devicesapi-test.herokuapp.com/api.
Kako sam koristio free heroku tier, posle nekih pola sata neaktivnosti aplikacija ide na sleep mode, pa
prvi request moze da potraje dok se ponovo pokrene (:
- Trenutno radi samo sa JSON formatom. Na XML branch-i je opciju da odgovori i na JSON i na XML request ali jos nisam rijesio problem sa parserom pa akcije za kreiranje/izmjenu podataka ne rade. Rails je prekinuo nativ podrsku za xml pa sam zaglavio tu. 

### TODO

- Add XML support along with json
- add some static page at root or link for docs
- fix edgecase/bugs in update actions
- improve tests
- finish and merge dynamic prop value search branch
- rename params
- maybe add aliases for models for clearer code
- add index to frequently searched columns
- improve database seed
- add custom error responses
