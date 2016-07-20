class CreateCatelogs < ActiveRecord::Migration
  def change
    create_table :catelogs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
