ActiveAdmin.register Order do
   permit_params  :product_id, :user_id


   form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
