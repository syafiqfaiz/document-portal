
categories_names = %W(loan contract disclaimer refinance project)
categories = []
categories_names.each do |name|
  categories << Category.create(name: name, description: Faker::Lorem.paragraph(2, true))
end



categories.each do |category|
  rand(3..10).times{category.documents.create(name: Faker::Company.buzzword, description: Faker::Lorem.paragraph(2, true))}
end