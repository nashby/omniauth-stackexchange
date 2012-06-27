# OmniAuth StackExchange [![TravisCI](https://secure.travis-ci.org/nashby/omniauth-stackexchange.png?branch=master)](http://travis-ci.org/nashby/omniauth-stackexchange) [![Gemnasium](https://gemnasium.com/nashby/omniauth-stackexchange.png)](https://gemnasium.com/nashby/omniauth-stackexchange)

This gem contains the StackExchange strategy for OmniAuth.

StackExchange uses the OAuth2 flow, you can read about it here: https://api.stackexchange.com/docs/authentication

## How To Use It

So let's say you're using Rails, you need to add the strategy to your `Gemfile`:

```ruby
gem 'omniauth-stackexchange'
```

You can pull them in directly from github e.g.:

```ruby
gem 'omniauth-stackexchange', :git => 'https://github.com/nashby/omniauth-stackexchange.git'
```

Once these are in, you need to add the following to your `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :stackexchange, "client_id", "client_secret", public_key: "key"
end
```

You will obviously have to put in your client_id, client_secret and public_key, which you get when you register your app with StackExchange (they call them Client Id, Client Secret and Key).

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
