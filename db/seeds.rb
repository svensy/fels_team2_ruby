# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Word.create(content: 'cow', meaning: 'bo', learned: true)
Word.create(content: 'turkey', meaning: 'ga tay', learned: true)
Word.create(content: 'chicken', meaning: 'ga', learned: false)
