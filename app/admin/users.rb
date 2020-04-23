ActiveAdmin.register User do

   permit_params  :first_name, :last_name, :password, :order_id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :provinces_id, :address

   form do |f|
    f.semantic_errors # shows errors on :base         # builds an input field for every attribute
    f.inputs do
      f.input :email
      f.input :address
      f.has_many :orders, allow_destroy: true do |n_f|
        n_f.input :product
      end
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
