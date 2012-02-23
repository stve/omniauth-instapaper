# OmniAuth Instapaper

This gem is an OmniAuth 1.0 Strategy for the [Instapaper Full API](http://www.instapaper.com/api/full)

It supports the Instapaper Full API which uses OAuth 1.0a and authenticates via XAuth.

## Usage

Add the strategy to your `Gemfile` alongside OmniAuth:

```ruby
gem 'omniauth'
gem 'omniauth-instapaper'
```

Then integrate the strategy into your middleware:

```ruby
use OmniAuth::Builder do
  provider :instapaper, ENV['INSTAPAPER_CONSUMER_KEY'], ENV['INSTAPAPER_CONSUMER_SECRET']
end
```

In Rails, you'll want to add to the middleware stack:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instapaper, ENV['INSTAPAPER_CONSUMER_KEY'], ENV['INSTAPAPER_CONSUMER_SECRET']
end
```

You will have to put in your consumer key and secret.

For additional information, refer to the [OmniAuth wiki](https://github.com/intridea/omniauth/wiki).

## <a name="build"></a>Build Status
[![Build Status](https://secure.travis-ci.org/spagalloco/omniauth-instapaper.png?branch=master)][travis]

[travis]: http://travis-ci.org/spagalloco/omniauth-instapaper

## <a name="dependencies"></a>Dependency Status
[![Dependency Status](https://gemnasium.com/spagalloco/omniauth-instapaper.png?travis)][gemnasium]

[gemnasium]: https://gemnasium.com/spagalloco/omniauth-instapaper

## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2012 Steve Agalloco. See [LICENSE](https://github.com/spagalloco/omniauth-instapaper/blob/master/LICENSE.md) for details.