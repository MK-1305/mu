  require 'carrierwave/storage/abstract'
  require 'carrierwave/storage/file'
  require 'carrierwave/storage/fog'

CarrierWave.configure do |config|

  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = 'mu-file-s3'
  config.asset_host = 'https://mu-file-s3.s3.amazonaws.com'
  # config.asset_host = 'https://s3.amazonaws.com/mu-file-s3'
  # config.fog_public = false
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1',
    path_style: true
  }
end