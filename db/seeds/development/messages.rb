require 'faker'
I18n.locale = :en

users = User.all
groups = Group.all

20_000.times do
  Message.create!(
    body: Faker::Lorem.sentence(3, true, 30),
    user: users.sample,
    group: groups.sample
  )
end
