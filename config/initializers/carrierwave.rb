
CarrierWave.configure do|config|
 config.fog_credentials = {
  provider:              'AWS',
  aws_access_key_id:     ENV['aws_access_key_id'],
  aws_secret_access_key: ENV['aws_secret_access_key'],
  region:                'ap-southeast-1'
 }
 config.fog_directory = ENV['fog_directory']
 config.fog_public = 'false'
 config.fog_attributes = {'Cache-Control' => "max-age=#{365.to_i}" }
end




