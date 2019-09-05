#!/bin/bash

eval whenever -w 
eval bundle exec unicorn -p 3000 -c config/unicorn/production.rb
# eval rake device:register
# eval bundle exec unicorn -p 3000 -c config/unicorn/production.rb &
# eval whenever -w