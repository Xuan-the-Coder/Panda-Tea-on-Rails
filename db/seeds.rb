# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rubygems'
require 'bundler/setup'
require 'nokogiri'
require 'open-uri'

CATEGORIES = %w[green black oolong pu-erh coffee accessories].freeze
NUMBER_OF_PRODUCTS = 100
PROVINCES = %w[PE NL NS	NB MB QC ON SK AB BC YT NT NU].freeze

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
  downloaded_image = open(URI.escape("https://source.unsplash.com/600x600/?#{[product.name].join(',')}"))
    product.image.attach(io: downloaded_image, filename: "m-#{[product.name].join('-')}.jpg")
end


creation_check(Category, CATEGORIES.size)
creation_check(Product, NUMBER_OF_PRODUCTS)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?+


tea_url = 'https://dragonteahouse.biz/pu-erh/'
tea_html = open(tea_url).read

tea_doc = Nokogiri::HTML(tea_html)
product_selector = 'ul.productGrid div.card-body > h4.card-title'
tea_name = tea_doc.css(product_selector)

puerh_id = Category.where(name: 'pu-erh').first.id

tea_name.each do |name|
  name_code = name.at_css('a').content
  puts name
  Product.create(name: name_code, price: Faker::Commerce.price, category_id: puerh_id, description: Faker::Coffee.notes)
end
