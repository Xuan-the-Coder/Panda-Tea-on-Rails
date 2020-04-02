# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CATEGORIES = %w[green black oolong pu-erh coffee accessories].freeze
NUMBER_OF_PRODUCTS = 100

def creation_check(model, expected_count)
  if expected_count != model.count
    puts "#{model} Issue! Wanted: #{expected_count} Created: #{model.count}"
  else
    puts "#{model.count} #{model} Objects Created"
  end
end

CATEGORIES.each do |category|
  category=Category.create(name: category)
end
coffee_id = Category.where(name: 'coffee').first.id

NUMBER_OF_PRODUCTS.times do
  product=Product.create(name: Faker::Coffee.blend_name, price: Faker::Commerce.price, category_id: coffee_id, description: Faker::Coffee.notes, )
  #downloaded_image = open(URI.escape("https://source.unsplash.com/600x600/?#{[product.name].join(',')}"))
    #product.image.attach(io: downloaded_image, filename: "m-#{[prodcut.name].join('-')}.jpg")
end

creation_check(Category, CATEGORIES.size)
creation_check(Product, NUMBER_OF_PRODUCTS)