# ruby-on-rails-20200810

A Rails API with JWT Authentication and Resque Integration

### Install

```
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

### Run

```
bundle exec rails server -p 3001
redis-server
QUEUE=* bundle exec rake environment resque:work&
```
### Obs.

login: admin@email.com
password: admin

## Made with

* [Resque](https://github.com/resque/resque)
* [JWT](https://github.com/jwt/ruby-jwt)
