source 'https://rubygems.org'

gem 'rails', '4.2.6'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'active_interaction'
gem 'puma'

# Translate text
gem 'yandex-translator'
gem 'espeak-ruby', require: 'espeak'

# Annotate models
gem 'annotate'

# Environment settings management
gem 'figaro'

# Scheduling and background jobs
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sinatra', require: false
gem 'whenever', require: false

# Admin area
gem 'activeadmin', github: 'activeadmin'
gem 'active_admin_theme'
gem 'russian'

gem 'rails_12factor', group: :production

group :console do
  gem 'awesome_print'
  gem 'hirb'
end

group :development, :test do
  # Debuging and profiling
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'i18n-debug', require: false
  gem 'meta_request'

  # Code styling
  gem 'rubocop', require: false
  gem 'bullet'

  # Guards
  gem 'guard', require: false
  gem 'guard-annotate', require: false
  gem 'guard-rubocop', require: false
  gem 'guard-bundler', require: false
  gem 'guard-minitest', require: false
  gem 'guard-rspec', require: false
  gem 'terminal-notifier'
  gem 'terminal-notifier-guard', '~> 1.6.1'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end
