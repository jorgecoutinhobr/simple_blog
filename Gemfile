source "https://rubygems.org"

gem "rails", "~> 7.2.2", ">= 7.2.2.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

# gem "redis", ">= 4.0.1"
gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", "~> 7.0.0", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails", "~> 7.0.0"
  gem "factory_bot_rails"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
end

# add by me
gem "css-zero", "~> 1.0.6"
gem "devise", "~> 4.9"
gem "pagy", "~> 8"
gem "randamu"
gem "pry-rails"
gem "sidekiq"

gem "dockerfile-rails", ">= 1.6", group: :development

gem "redis", "~> 5.3"

gem "aws-sdk-s3", "~> 1.176", require: false
