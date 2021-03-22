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

10.times do |n|
  Order.create!(
   customer_id:"1",
   shipping_postal_code:"5555555",
   shipping_address:"東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階",
   shipping_name:"山田花子",
   payment_method: 0,
   total_price:"5890",
   postage:"800",
   order_status:0,
)
end
