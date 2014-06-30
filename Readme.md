# Beamly Gem

[![Gem Version](https://badge.fury.io/rb/beamly.svg)](http://badge.fury.io/rb/beamly)

Create an account on the beamly developers website to get your api keys.

https://develop.beamly.com/admin/applications

## Contributing

Feel free to create a pull request as per usual github process.

Let me know if you are using this gem for your project and any features you would like, as this gem does not expose all of the api (it can be easily addeD). I only created this for the features I needed in the app I was creating at the time.

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

``epg = Beamly::Epg.new``

``epg.regions`` returns an array of all of the regions.

``epg.providers`` returns an array of all of the regions.

``epg.catalogues(region, provider)`` returns an array of all of the catalogues. Provide a region id and provider id.

``epg.epg(id)`` returns an array of the epg. Id is from the catalogues reguest.

``epg.schedule(id,date)`` returns an array of the schedules. Provide a service id from the epg request and a date in the format YYYY/MM/DD

``epg.broadcast_event(id)`` returns an hash of a broadcast event. Provide an id from the schedule request

``epg.episode(id)`` returns an hash of a episode event. Provide an id from the schedule request

## Tests

Include your api id and key as environment variables when running the tests

``BEAMLY_TEST_ID=xxx BEAMLY_TEST_KEY=xxx bundle exec rspec``
