if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

else

  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      provider:               'AWS',
      aws_access_key_id:      ENV['aws_access_key_id'],
      aws_secret_access_key:  ENV['aws_secret_access_key'],
      region:                 'ap-southeast-1',
      path_style: true
    }
    config.fog_directory = ENV['fog_directory']
    config.asset_host = "//s3-ap-southeast-1.amazonaws.com/#{ENV['fog_directory']}"
    config.fog_attributes = { 'Cache-Control' => 'max-age=315360000' }

  end
end


