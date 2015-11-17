# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "123456",
             password_confirmation: "123456")

33.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
Category.create(name: 'pickla')
Category.create(name: 'okla')
Category.create(name: 'memidla')
Category.create(name: 'feedla')
Category.create(name: 'lala')
Category.create(name: 'ohnola')