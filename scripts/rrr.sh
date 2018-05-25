#!/bin/bash

bundle exec rake factory_bot:lint
bundle exec rubocop
bundle exec brakeman
bundle exec rubycritic app lib --mode-ci --path /tmp/rubycritic/
bundle exec bundle-audit check --update
bundle exec rake spec:javascript
bundle exec rspec
