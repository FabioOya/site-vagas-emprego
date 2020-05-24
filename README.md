# Description

Careers Website on RoR, current on development.

## Installation

Run bundle install in your terminal.

```bash
bundle install
```

## Running tests with RSpec

```RSpec
# Default: Run all spec files (i.e., those matching spec/**/*_spec.rb)
$ rspec

# Run all spec files in a single directory (recursively)
$ rspec spec/models

# Run a single spec file
$ rspec spec/controllers/accounts_controller_spec.rb

# Run a single example from a spec file (by line number)
$ rspec spec/controllers/accounts_controller_spec.rb:8

# See all options for running specs
$ rspec --help
```

## Gems
```  
  gem 'devise'  - to generate user models, views and validations
  gem 'capybara'  - gem for tests
  gem 'factory_bot_rails' - to simplify test write
  gem 'rspec-rails' - gem for tests
```

## Ruby Version
``` 
Ruby '2.6.3'
``` 

## Rails Version
``` 
Rails '6.0.2'
``` 