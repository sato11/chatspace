require 'faker'
I18n.locale = :en

300.times do |n|
  fn = Faker::Name.first_name
  ln = Faker::Name.last_name

  User.create!(
    name:     "#{fn} #{ln}",
    email:    "#{fn.downcase}.#{ln.downcase}.#{n + 1}@example.com",
    password: 'password',
    password_confirmation: 'password'
  )
end
