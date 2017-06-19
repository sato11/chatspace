# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :text(65535)
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  group_id   :integer
#
# Indexes
#
#  index_messages_on_group_id  (group_id)
#  index_messages_on_user_id   (user_id)
#

FactoryGirl.define do
  factory :message do
    body  Faker::Lorem.sentence
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'messages', 'images', 'test_image.jpeg')) }
    user  { build(:user) }
    group { build(:group) }
  end
end
