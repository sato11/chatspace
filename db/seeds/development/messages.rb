require 'faker'
I18n.locale = :en

users = User.all

20_000.times do
  user = users.sample
  group = user.groups.sample

  Message.create!(
    body: Faker::Lorem.sentence(3, true, 30),
    user: user,
    group: group
  )
end
