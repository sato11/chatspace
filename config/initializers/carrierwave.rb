CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
  elsif Rails.env.development? || Rails.env.production?
    config.storage = :fog
  end
end
