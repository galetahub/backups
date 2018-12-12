# Backup template for simple project (microservice)

## Install

    git clone https://github.com/galetahub/backups.git
    cd backups
    bundle install --deployment

## Setup your configuration

    vim config.rb

## Check if everything is ok

    bundle exec backup check -c config.rb

## Run backup

    ./bin/run.sh

This project rocks and uses the MIT-LICENSE.
