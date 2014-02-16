# Zeebox Gem

Create an account on the zeebox developers website to get your api keys.

https://develop.zeebox.com/admin/applications

## Installation

Add the following to your `Gemfile`:

```ruby
gem "zeebox"
```

Add a file `config/initializers/zeebox.rb`` containing:

Zeebox.configure do |config|
  config.id = 'c9a8a7fb'
  config.key = '1009de15cb2d654b060a90ddffcc6c5c'
end



