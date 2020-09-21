json.extract! category_products, :id, :name, :price, :category_id, :description

json.image_url url_for(category_products.image)

json.url product_url(category_products, format: :json)