source 'https://rubygems.org'
  
group :test do
  gem 'json', '~> 1.8.1', :platforms => [:ruby_18, :jruby]
  gem 'rspec', '~> 3.0.0.beta2'
  gem 'vcr', '~> 2.9.0'
  gem 'webmock', '~> 1.17.4'
  gem 'factory_girl', "~> 4.4.0"

end

group :development do
  gem 'awesome_print', :require => 'ap'
  gem 'guard-rspec', '~> 4.2.8'
  gem 'hirb-unicode'
  gem 'yard'
end

group :test, :development do
  gem 'pry'
end

gemspec