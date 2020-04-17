class NullableOrderIdFromUsers < ActiveRecord::Migration[6.0]
  def change

    change_column :users, :order_id, :string, :null=>true
  end
end
