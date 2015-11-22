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

5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

category1 = Category.create(name: 'Basic 500 words')
category2 = Category.create(name: 'Nature')
category3 = Category.create(name: 'Animal')
category4 = Category.create(name: 'Date')
category5 = Category.create(name: 'Best Pet')

30.times {
  word_content = Faker::Lorem.word
  category1.words.create!(content: word_content)
}

30.times {
  word_content = Faker::Lorem.word 
  category2.words.create!(content: word_content)
}

30.times {
  word_content = Faker::Lorem.word 
  category3.words.create!(content: word_content)
}

30.times {
  word_content = Faker::Lorem.word 
  category4.words.create!(content: word_content)
}

