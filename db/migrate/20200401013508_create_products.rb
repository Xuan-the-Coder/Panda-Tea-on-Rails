class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.references :category
      t.string :image
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
