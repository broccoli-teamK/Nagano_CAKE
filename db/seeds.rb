# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
  email: 'Nagano-cake@admin.com',
  password: 'admin_sign_in'
  )
  
10.times do |n|
  Product.create!(
   genre_id: '1',
   name: "ケーキ#{n+1}",
   introduction: "ケーキです",
   price: "1000",
   image: File.open('./app/assets/images/cake.png'),
   sales_status: true
  )
end

