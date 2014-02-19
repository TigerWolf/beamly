# Zeebox Gem

Create an account on the zeebox developers website to get your api keys.

https://develop.zeebox.com/admin/applications

## Still in early development

This gem is still in development and will change dramatically until it is released on ruby gems. Keep this in mind if you plan to use this in a production environment as its not recommended.

The gem only currently supports AU region but will support all in the future.

## Installation

Add the following to your `Gemfile`:

```ruby
gem "zeebox"
```

Add a file `config/initializers/zeebox.rb`` containing:

```
Zeebox.configure do |config|
  config.id = 'c9a8a7fb'
  config.key = '1009de15cb2d654b060a90ddffcc6c5c'
end
```

## Methods

``Zeebox::Epg.regions`` returns an array of all of the regions.
``Zeebox::Epg.providers`` returns an array of all of the regions.
``Zeebox::Epg.catalogues(region, provider)`` returns an array of all of the catalogues. Provide a region id and provider id.
``Zeebox::Epg.epg(id)`` returns an array of the epg. Id is from the catalogues reguest.
``Zeebox::Epg.schedule(id,date)`` returns an array of the schedules. Provide a service id from the epg request and a date in the format YYYY/MM/DD
``Zeebox::Epg.broadcast_event(id)`` returns an hash of a broadcast event. Provide an id from the schedule request
``Zeebox::Epg.episode(id)`` returns an hash of a episode event. Provide an id from the schedule request
