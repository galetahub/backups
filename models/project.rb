##
# Backup Generated: projects
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t projectname -c backup/config.rb
#
Backup::Model.new('projectname', 'Archive project with database') do
  ##
  # Split [Splitter]
  #
  # Split the backup file in to chunks of 250 megabytes
  # if the backup file size exceeds 250 megabytes
  #
  split_into_chunks_of 2048

  # Some project
  folder = '/var/www/projectname/current'

  archive File.basename(folder) do |archive|
    # add project folder
    archive.add folder

    # excludes tmp, cache, logs
    archive.exclude File.join(folder, 'log')
    archive.exclude File.join(folder, 'tmp')
    archive.exclude File.join(folder, 'vendor/bundle')
    archive.exclude File.join(folder, 'public/cache')
    archive.exclude File.join(folder, 'public/assets')
  end

  ##
  # PostgreSQL [Database]
  #
  database PostgreSQL do |db|
    # Dump all databases
    db.name = "projectname"
    db.additional_options = ["-xc"]
  end

  ##
  # Amazon Simple Storage Service [Storage]
  #
  store_with S3 do |s3|
    s3.path = 'projectname'
    s3.keep = 5
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip do |compression|
    compression.level = 9
  end

  ##
  # Slack [Notifier]
  #
  notify_by Slack do |slack|
    slack.on_success = true
    slack.on_warning = true
    slack.on_failure = true
  end
end
