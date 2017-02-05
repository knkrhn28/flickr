# flickr-digger [![Build Status](https://secure.travis-ci.org/msdundar/flickr.svg?branch=master)](http://travis-ci.org/msdundar/flickr) [![Code Climate](https://img.shields.io/codeclimate/github/msdundar/flickr.svg)](https://codeclimate.com/github/msdundar/flickr)

**flickr-digger** is a Rails 5 application which communicates with Flickr API and returns photos that matches with the given parameters.

**Works fine with `Ruby 2.2.3` and other versions are not tested yet.

## Installation

1. Clone the repository.
2. `bundle install`
3. `rake db:setup`
4. edit `config/database.yml` and add your secrets.
5. edit `config/application.yml` and add the following keys.

```
flickr_api_key: YOUR_KEY
RECAPTCHA_SITE_KEY: YOUR_KEY
RECAPTCHA_SECRET_KEY: YOUR_KEY
```

## Tests

```ruby
bundle exec rspec
```

## Contributing

1. `fork` the repo ( https://github.com/msdundar/mernis/fork )
2. Create a branch (git checkout -b cool-feature)
3. Commit the changes (git commit -am 'My cool features')
4. Push the branch (git push origin cool-feature)
5. Make a pull request


## Questions

```
msdundars@gmail.com
```