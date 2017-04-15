require 'faker'
I18n.locale = :en

users = User.all

1000.times do
  Group.create!(
    name: Faker::Name.title,
    users: users.sample(rand(5..20))
  )
end
