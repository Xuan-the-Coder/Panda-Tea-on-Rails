ActiveAdmin.register Product do
  permit_params :name, :price, :category_id, :description, :status

end
