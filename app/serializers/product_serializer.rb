class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :price, :category_id, :description
end
