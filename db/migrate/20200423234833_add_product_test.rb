class AddProductTest < ActiveRecord::Migration[6.0]
  def up
    Product.create(name: "Banzhang Ecological Tea Cake")
  end
end
