# OmniAuth StackExchange [![TravisCI](https://secure.travis-ci.org/nashby/omniauth-stackexchange.png?branch=master)](http://travis-ci.org/nashby/omniauth-stackexchange)

This gem contains the StackExchange strategy for OmniAuth.

StackExchange uses the OAuth2 flow, you can read about it here: https://api.stackexchange.com/docs/authentication

## How To Use It

So let's say you're using Rails, you need to add the strategy to your `Gemfile`:

```ruby
gem 'omniauth-stackexchange'
```

You can pull them in directly from github e.g.:

```ruby
gem 'omniauth-stackexchange', git: 'https://github.com/nashby/omniauth-stackexchange.git'
```

Once these are in, you need to add the following to your `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :stackexchange, 'client_id', 'client_secret', public_key: "key", site: 'stackoverflow'
end
```

or with Devise to your `config/initializers/devise.rb`

```ruby
  config.omniauth :meetup, ENV['client_id'], ENV['client_secret'], callback_url: 'http://example.com/users/auth/stackexchange/callback'
```
**Starting from version 1.4 in omniauth-oauth2 you must provide same callback url you have provided on API dashboard otherwise authentication won't work.**


You will obviously have to put in your client_id, client_secret and public_key, which you get when you register your app with [StackExchange](https://stackapps.com/apps) (they call them Client Id, Client Secret and Key).

You will also need to specify a site option to uniquely identify the StackExchange site (e.g. `stackoverflow` or `superuser`) you wish to authenticate against.  A list of valid site api keys can be found at https://api.stackexchange.com/docs/sites. It's `stackoverflow` by default.

If your application needs to be able to support multiple StackExchange sites, you can pass the site api key as the value for a GET parameter named sites (e.g. /auth/stackexchange?site=superuser)

Now just follow the README at: https://github.com/intridea/omniauth

## Supported Rubies

OmniAuth StackExchange is tested under 1.9.3.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2012 by Vasiliy Ermolovich
