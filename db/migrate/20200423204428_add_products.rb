class AddProducts < ActiveRecord::Migration[6.0]
  require 'rubygems'
  require 'bundler/setup'
  require 'nokogiri'
  require 'open-uri'


  def up
    tea_url = 'https://dragonteahouse.biz/pu-erh/'
    tea_html = open(tea_url).read

    tea_doc = Nokogiri::HTML(tea_html)
    product_selector = 'ul.productGrid div.card-body > h4.card-title'
    tea_name = tea_doc.css(product_selector)

    coffee_id = Category.where(name: 'pu-erh').first.id
    tea_name.each do |name|
      name_code = name.at_css('a').content
      Product.create(name: name_code, price: Faker::Commerce.price, category_id: coffee_id, description: Faker::Coffee.notes)
    end
  end
end
