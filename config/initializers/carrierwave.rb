unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAQWC5LJE35ZPMHZFS',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_provider = 'fog-aws'
    config.fog_directory  = 'mu-file-s3'
    config.cache_storage = :fog
  end
end