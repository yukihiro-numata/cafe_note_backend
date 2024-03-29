source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

gem 'activerecord-import', '1.4.0'
gem 'grape', '1.6.2'
gem 'grape-entity', '0.10.2'
gem 'jwt', '2.5.0'

group :development, :test do
  gem 'rubocop', '1.35', require: false
  gem 'rubocop-performance', '1.14.3', require: false
  gem 'rubocop-rails', '2.15.2', require: false
  gem 'rubocop-rspec', '2.12.1'
  gem 'pry-rails', '0.3.9'
  gem 'pry-doc', '1.3.0'
  gem 'pry-byebug', '3.10.1'
  gem 'pry-stack_explorer', '0.6.1'
end

group :development do
  gem 'annotate', '3.2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :test do
  gem 'factory_bot_rails', '6.2.0'
  gem 'rspec-json_matcher', '0.2.0'
  gem 'rspec-parameterized', '0.5.2'
  gem 'rspec-rails', '5.1.2'
end
