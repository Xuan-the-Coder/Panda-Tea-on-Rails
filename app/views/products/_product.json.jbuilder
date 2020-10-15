json.extract! product, :id, :name, :price, :category_id, :description

json.image_url url_for(product.image)

json.url product_url(product, format: :json)