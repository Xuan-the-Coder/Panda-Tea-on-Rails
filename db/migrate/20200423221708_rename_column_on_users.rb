class RenameColumnOnUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :provinces_id, :province_id
  end
end
