#CarrierWave something
CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = "fish"
  config.upyun_password = 'fishgyuyi177'
  config.upyun_bucket = "forward"
  config.upyun_bucket_domain = "forward.b0.upaiyun.com"
end