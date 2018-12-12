#!/bin/bash

# Settings
APP_ROOT=/var/www/backup
APP_USER=dev
APP_GROUP=dev
APP_MODEL=modelname

CMD="bundle exec backup perform -t $APP_MODEL -c config.rb -r $APP_ROOT --data-path data --tmp-path tmp"

cd $APP_ROOT

exec 2>&1
exec chpst -u $APP_USER:$APP_GROUP $CMD
