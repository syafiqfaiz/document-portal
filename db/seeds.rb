categories_names = %W(loan contract disclaimer refinance project)
categories = []
categories_names.each do |name|
  categories << Category.create(name: name, description: Faker::Lorem.paragraph(2, true))
end

categories.each do |category|
  rand(3..10).times do 
    category.documents.create(name: Faker::Company.bs, description: Faker::Lorem.paragraph(2, true))
  end
end

plans = []
plans << Plan.create(name: 'Yearly Subscription', description: "One year unlimited access", price: 100.00, active: true, duration: 12)
plans << Plan.create(name: 'Monthly Subscription', description: "One month unlimited access", price: 50.00, active: true, duration: 1)

admin = User.create(email: "admin@admin.com", password: "password", admin: true)

