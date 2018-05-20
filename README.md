# Git for version control

- git status
- git add .
- git commit -m "<your_message>"
- git push origin <github_repo>

## Configure Git

- git config --global user.name "<your_username>"
- git config --global user.email "<your_email>"

# Rails 5 setup

- ruby: 2.5.0
- rails: 5.2.0

# RSpec setup
- gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
- gem 'capybara', '~> 3.1'
- bundle binstubs rspec-core
- rbenv rehash

## RSpec feature
- rails generate rspec:feature creating_article

# Guard setup
- gem 'guard', '~> 2.14', '>= 2.14.2'
- gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
- gem 'guard-cucumber', '~> 2.1', '>= 2.1.2'
- bundle binstubs guard
- rbenv rehash

## Configure Guard/Cucumber
- guard init
- cucumber --init
