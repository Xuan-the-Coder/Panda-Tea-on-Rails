json.extract! category, :id, :name

json.image_url url_for(category.image)

json.url category_url(category, format: :json)