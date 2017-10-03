Spree Dynamic Promotion Expiry Date
===============================

This extension allows Spree Promotion to expire in the time you set after the user applies the promotion. 

## Current features: 
1. After n seconds
  The promotion will expire after the user applies the promotion plus the time you set. 

2. Floor to m seconds with maximum of n Seconds
  
    For example, if it floors to 30 minutes (m = 1,800) and max 1.5 hours (n = 5,400), when the user applies the promotion at 14:53, the promotino will end in 16:00. If it floors 1 hour (m = 3,600) with max 5 hours (n = 18,000), when the user applies the promotion at 03:35, the promotion will end in 08:00. 
  
    If it floors to 1 day (m = 86,400) with maximum of 1 day and 1 hour (n = 90,000), when the user applies the promotion at 07/08/2017 23:59, the promotion ends in 09/08/2017 00:00. When the user applies the promotion at 07/08/2017 05:13, the promotion ends in 08/08/2017 00:00. 
  
    This feature is for marketing gimmick giving out discount to certain path every n hours. 

## Installation

1. Add this extension to your Gemfile with this line:
  ```ruby
  gem 'spree_dynamic_promotion_expiry_date', github: 'charleswong28/spree_dynamic_promotion_expiry_date', branch: 'X-X-stable'
  ```

  The `branch` option is important: it must match the version of Spree you're using.
  For example, use `3-1-stable` if you're using Spree `3-1-stable` or any `3.1.x` version.

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_dynamic_promotion_expiry_date:install
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.

## TO-DO
1. Testing 
2. Front-end
  We use react in our front-end. We may need to create another project to work on this. 

## Testing

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_dynamic_promotion_expiry_date/factories'
```

## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

Copyright (c) 2017 EONIQ (HK) Limited, released under MIT License
