source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.5.1'
gem 'rails', '~> 5.2.3'
gem 'devise'
# Use #gem 'CanCan' or #gem 'petergate' for authorization of Active Record
gem 'cancan' 
gem 'petergate'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
gem 'sprockets', '~> 3.7' 
gem 'jquery'
gem 'jquery-rails'
gem 'faraday'
# Use Puma as the app server
gem 'puma', '~> 3.11'

gem 'twitter-bootstrap-rails', '~> 4.0'
# css .js framework
gem 'foundation-rails'
gem 'autoprefixer-rails'
gem 'devise-foundation-views'
gem "font-awesome-rails"
gem 'prawn'
gem 'responders'
gem 'prawn-table'
#gem 'bulma', '~> 0.1.0'
gem 'simple_form', '~> 4.1'
#Cocoon makes it easier to handle nested forms.
gem 'cocoon', '~> 1.2', '>= 1.2.14'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.5'
gem 'avatar', '~> 0.2.0'

gem 'guard'
gem 'activeadmin'
gem 'bootstrap'

gem 'carrierwave', '~> 1.3', '>= 1.3.1'

gem "figaro"
gem 'dotenv-rails'
#easy manipulate images
gem 'mini_magick', '~> 4.8'
#you can use paperclip   imagemagik figaro or carruerwave and mini magick and dotenv rails
gem 'paperclip'
gem 'image_magick'
gem 'aws-sdk', '~> 2.3'
#gem 'fog-aws'
group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pg'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  
end


group :production do
  # Adds support for Capybara system testing and selenium driver
 
  gem 'popper_js', '~> 1.14.3'
  gem 'sassc-rails', '~> 2.0.0'
  gem 'pg'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'redis'