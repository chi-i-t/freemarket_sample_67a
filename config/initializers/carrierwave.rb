require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  # config.fog_provider = 'fog/aws' #テストコード実行の際にエラーが出るので一時的にコメントアウトしました。by okmt
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'freemarket67a'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarket67a'
end