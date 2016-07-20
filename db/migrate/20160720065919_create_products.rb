class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.float :discount
      t.string :img
      t.string :img_list
      t.integer :count_buy
      t.integer :view
      t.references :catelog, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
