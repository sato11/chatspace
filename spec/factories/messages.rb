FactoryGirl.define do
  factory :message do
    body  Faker::Lorem.sentence
    user  { create(:user) }
    group { create(:group) }
  end
end
