#!/bin/bash

eval cron
eval whenever --update-crontab
eval rake device:register
eval bundle exec unicorn -p 3000 -c config/unicorn/production.rb