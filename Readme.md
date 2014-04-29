# Zeebox Gem

Create an account on the zeebox developers website to get your api keys.

https://develop.zeebox.com/admin/applications

## Still in early development

This gem is still in development and will most likely change dramatically. Keep this in mind if you plan to use this in a production environment as its not recommended.

The gem is only tested against the AU region currently.

## Installation

Add the following to your `Gemfile`:

```ruby
gem "zeebox"
```

Add a file `config/initializers/zeebox.rb`` containing:

```
Zeebox.configure do |config|
  config.id = 'akdwad'
  config.key = '24144de132cb2d622bzxz60a90ggasffcc6c5c'
  config.region = 'AU'
end
```

## Methods

Here are the methods supported so far and a quick description.

``Zeebox::Epg.regions`` returns an array of all of the regions.

``Zeebox::Epg.providers`` returns an array of all of the regions.

``Zeebox::Epg.catalogues(region, provider)`` returns an array of all of the catalogues. Provide a region id and provider id.

``Zeebox::Epg.epg(id)`` returns an array of the epg. Id is from the catalogues reguest.

``Zeebox::Epg.schedule(id,date)`` returns an array of the schedules. Provide a service id from the epg request and a date in the format YYYY/MM/DD

``Zeebox::Epg.broadcast_event(id)`` returns an hash of a broadcast event. Provide an id from the schedule request

``Zeebox::Epg.episode(id)`` returns an hash of a episode event. Provide an id from the schedule request

## Tests

Include your api id and key as environment variables when running the tests

``ZEEBOX_TEST_ID=xxx ZEEBOX_TEST_KEY=xxx bundle exec rspec``
