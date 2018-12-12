require ::File.expand_path('../config/environment', __FILE__)

##
# Utilities
#
# If you need to use a utility other than the one Backup detects,
# or a utility can not be found in your $PATH.
#
Utilities.configure do
  pg_dump '/usr/bin/pg_dumpall'
  redis_cli '/usr/local/bin/redis-cli'
end

Storage::S3.defaults do |s3|
  s3.access_key_id     = options.amazon.access_key_id
  s3.secret_access_key = options.amazon.secret_access_key
  s3.bucket            = options.amazon.bucket
  s3.region            = options.amazon.region
end

Database::MySQL.defaults do |db|
  db.username           = options.mysql.username
  db.password           = options.mysql.password
  db.host               = options.mysql.host
  db.port               = options.mysql.port

  db.additional_options = ['--single-transaction', '--events']
end

Database::PostgreSQL.defaults do |db|
  db.username           = options.postgresql.username
  db.password           = options.postgresql.password
  db.host               = options.postgresql.host
  db.port               = options.postgresql.port
  db.socket             = options.postgresql.socket
end

Notifier::Slack.defaults do |slack|
  slack.webhook_url = options.slack.webhook_url
end
