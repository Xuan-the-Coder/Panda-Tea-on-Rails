require 'uri'

class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :price, :category_id, :description, :url_for(product.image)


  belongs_to :category
end
