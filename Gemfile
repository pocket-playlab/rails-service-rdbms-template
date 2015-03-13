source 'https://rubygems.org'
ruby '2.2.0'

gem 'newrelic_rpm'
gem 'pg'
gem 'puma'
gem 'rails', '~> 4.2.0'
gem 'redis'
gem 'unity-middleware'

group :test, :development do
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.1'
end

group :development do
  gem 'reek'
  gem 'rubocop'
  gem 'spring'
end

group :test do
  gem 'database_cleaner', '~> 1.4.0'
  gem 'sqlite3'
end
