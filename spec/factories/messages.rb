FactoryGirl.define do
  factory :message do
    body  Faker::Lorem.sentence
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'messages', 'images', 'test_image.jpeg')) }
    user  { build(:user) }
    group { build(:group) }
  end
end
