Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'
      resource '*', headers: :any, methods: [:get, :post, :patch, :put]
    end
  end

Rails.application.config.hosts << "panda-ecommerce.herokuapp.com"

Rails.application.config.hosts << "product.com"

