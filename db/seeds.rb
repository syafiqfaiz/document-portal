# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories_names = %W(loan contract disclaimer refinance project)
categories = []
categories_names.each do |name|
  categories << Category.create(name: name, desciption: Faker::Lorem.paragraph(2, true))
end