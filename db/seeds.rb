User.destroy_all

10.times do
  password = "12345678"
  user = User.create(email: Faker::Internet.email, password: password, password_confirmation: password)

  5.times do
    user.created_events.create(name: Faker::Name.title)
  end
end