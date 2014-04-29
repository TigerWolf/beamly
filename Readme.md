# Beamly Gem

[![Gem Version](https://badge.fury.io/rb/beamly.svg)](http://badge.fury.io/rb/beamly)

Create an account on the beamly developers website to get your api keys.

https://develop.beamly.com/admin/applications

## Still in early development

This gem is still in development and will most likely change dramatically. Keep this in mind if you plan to use this in a production environment as its not recommended.

The gem is only tested against the AU region currently.

## Installation

Add the following to your `Gemfile`:

```ruby
gem "beamly"
```

Add a file `config/initializers/beamly.rb` containing:

```
Beamly.configure do |config|
  config.id = 'akdwad'
  config.key = '24144de132cb2d622bzxz60a90ggasffcc6c5c'
  config.region = 'AU'
end
```
At the moment you should include this file in your app.

## Methods

Here are the methods supported so far and a quick description.

``Beamly::Epg.regions`` returns an array of all of the regions.

``Beamly::Epg.providers`` returns an array of all of the regions.

``Beamly::Epg.catalogues(region, provider)`` returns an array of all of the catalogues. Provide a region id and provider id.

``Beamly::Epg.epg(id)`` returns an array of the epg. Id is from the catalogues reguest.

``Beamly::Epg.schedule(id,date)`` returns an array of the schedules. Provide a service id from the epg request and a date in the format YYYY/MM/DD

``Beamly::Epg.broadcast_event(id)`` returns an hash of a broadcast event. Provide an id from the schedule request

``Beamly::Epg.episode(id)`` returns an hash of a episode event. Provide an id from the schedule request

## Tests

Include your api id and key as environment variables when running the tests

``BEAMLY_TEST_ID=xxx BEAMLY_TEST_KEY=xxx bundle exec rspec``
